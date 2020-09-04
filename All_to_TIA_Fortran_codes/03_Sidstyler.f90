module Table
    implicit none
    type OrigTable
        integer(kind=1) :: volume, channel, note
        integer(kind=2) :: duration
    end type

    type WorkTable
        integer(kind=1) :: volume, channel, note
    end type

end module

module Loader
    use Table
    implicit none
    contains

    function GetLines(path) result(lines)
        character(:), allocatable :: path
        integer :: lines
        integer(kind=1) :: io
        character :: waste

        lines=0

        open(1, file=path, status="old", action="read", iostat=io)
        do
            read (1, *, iostat=io) waste
            if (io/=0) exit
            lines=lines+1

        end do
        close(1)

    end function


end module

module Source
    use Table
    implicit none
    contains

    subroutine Load_Sources(Source1, Source2, Durations, path1, path2)
        type(OrigTable), dimension(:), allocatable, intent(inout) :: Source1, Source2
        integer(kind=2), dimension(:), allocatable, intent(inout) :: Durations
        character(:), allocatable, intent(in) :: path1, path2
        integer :: i
        integer(kind=1) :: io

        open(1, file=path1, status="old", action="read", iostat=io)
        open(2, file=path2, status="old", action="read", iostat=io)


        do i=1, size(Source1), 1
            read(1, *, iostat=io) Source1(i)%volume, Source1(i)%channel, Source1(i)%note, Source1(i)%duration
            read(2, *, iostat=io) Source2(i)%volume, Source2(i)%channel, Source2(i)%note, Source2(i)%duration
            Durations(i) =  Source1(i)%duration

        end do
        close(1)
        close(2)

    end subroutine

end module

module vibr
    implicit none
    contains
    subroutine Load_Vib(vibratio)
        integer(kind=1), intent(out) :: vibratio
        integer(kind=1) :: io

        open(1, file="vibratio.txt", status="old", iostat=io)
        read(1,*,iostat=io) vibratio
        close(1)

    end subroutine

end module
module Layout
    use Table
    implicit none
    contains

    function dubdub(Source, Durations, summ) result(new)
        integer :: summ, i, j, counter
        type(OrigTable), dimension(:), allocatable :: Source
        integer(kind=2), dimension(:), allocatable :: Durations
        type(WorkTable), dimension(summ) :: new

        counter=1

        do i=1, size(Source), 1
            do j=1, Durations(i), 1
                new(counter)%volume=Source(i)%volume
                new(counter)%channel=Source(i)%channel
                new(counter)%note=Source(i)%note
                !write(*,*) new(counter)%volume, new(counter)%channel, new(counter)%note, j

                counter=counter+1
            end do
        end do


    end function
end module

module Mixture
    use Table
    implicit none
    contains
    function MixThem(vibratio, Notes1, Notes2) result(new)
        type(WorkTable), dimension(:), allocatable, intent(in) :: Notes1, Notes2
        type(WorkTable), dimension(size(Notes1)) :: new
        integer(kind=1), intent(in) :: vibratio
        integer :: i, counter
        integer(kind=1) :: second

        counter=1
        second=0

        do i=1, size(Notes1), 1
            if (second==0) then
                new(i)%volume=Notes1(i)%volume
                new(i)%channel=Notes1(i)%channel
                new(i)%note=Notes1(i)%note

                if ((Notes1(i)%note/=Notes1(i+1)%note).OR.&
                &(Notes1(i)%channel/=Notes1(i+1)%channel)) then
                    counter=vibratio
                    second=not(0)
                end if


            else
                new(i)%volume=Notes2(i)%volume
                new(i)%channel=Notes2(i)%channel
                new(i)%note=Notes2(i)%note

                if ((Notes2(i)%note/=Notes2(i+1)%note).OR.&
                &(Notes2(i)%channel/=Notes2(i+1)%channel)) then
                    counter=vibratio
                    second=not(0)
                end if
            end if

            if (counter<vibratio) then
                counter=counter+1
            else
                counter=1
                second=not(second)
            end if

        end do


    end function
end module

module WriteOutput
    use Table
    implicit none
    contains
    subroutine Writer(TempOutPut)
        type(WorkTable), dimension(:), allocatable :: TempOutPut
        integer(kind=1) :: io
        integer :: i, counter

        open(1, file="SIDDone.txt", status="replace", iostat=io, action="write")

        counter=1
        do i=1, size(TempOutPut), 1
            if ((TempOutPut(i)%note/=TempOutPut(i+1)%note).OR.(TempOutPut(i)%channel/=TempOutPut(i+1)%channel&
            &).OR.(i==size(TempOutPut))) then
                write(1,"(I2, 1x, I2, 1x, I2, 1x, I4)") TempOutPut(i)%volume, TempOutPut(i)%channel, &
                &TempOutPut(i)%note, counter

                counter=1
            else
                counter=counter+1
            end if

        end do
        close(1)
    end subroutine
end module

program SID
    use Table
    use Loader
    use Source
    use Layout
    use vibr
    use Mixture
    use WriteOutput

    implicit none
    type(OrigTable), dimension(:), allocatable :: Source1, Source2
    type(WorkTable), dimension(:), allocatable :: Notes1, Notes2, TempOutPut
    integer(kind=2), dimension(:), allocatable :: Durations
    integer :: lines, i, summ
    character(:), allocatable :: path1, path2, path3
    integer(kind=1) alloc_stat, vibratio

    path1="SID1.txt"
    path2="SID2.txt"


    lines=GetLines(path1)

    allocate(Source1(lines), stat=alloc_stat)
    allocate(Source2(lines), stat=alloc_stat)
    allocate(Durations(lines), stat=alloc_stat)

    call Load_Sources(Source1, Source2, Durations, path1, path2)
    call Load_Vib(vibratio)

    summ=0
    do i=1, size(Durations), 1
        summ=summ+Durations(i)
    end do
    !write(*,*) summ



    allocate(Notes1(summ) , stat=alloc_stat)
    allocate(Notes2(summ) , stat=alloc_stat)
    allocate(TempOutput(summ) , stat=alloc_stat)


    Notes1=dubdub(Source1, Durations, summ)
    Notes2=dubdub(Source2, Durations, summ)


    !do i=1, size(Notes1), 1
    !    write(*,*) Notes1(i)
    !do i=1, size(Durations), 1
    !    write(*,*) Durations(i)
    !end do

    TempOutPut=MixThem(vibratio, Notes1, Notes2)


    !do i=1, size(TempOutPut), 1
    !    write(*,*) TempOutPut(i)
    !end do
    call Writer(TempOutPut)

end program

