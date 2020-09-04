module Table
    type DataTable
        integer(kind=1) :: volume, channel, note
        integer(kind=2) :: duration
    end type

    type RawTable
        integer(kind=1) :: volume, channel, note

    end type

end module

module Lines
    implicit none
    contains
    function GetLines(path) result(lines)
        integer :: lines, io
        character(8) :: path
        character(1) :: waste

        open(1, file=path, status="old", iostat=io)
        lines=0

        do
            read(1, *, iostat=io) waste
            if (io/=0) exit
            lines=lines+1

        end do
        !write(*,*) lines
        close(1)

    end function

end module

module Fill
    use Table
    implicit none
    contains

    function Filler(path, lines) result(temp)
        integer :: lines, i, io
        type(DataTable), dimension(lines) :: temp
        character(8) :: path

        open(1, file=path, status="old", iostat=io)

        do i=1, lines, 1
            read(1, *) temp(i)%volume, temp(i)%channel, temp(i)%note, temp(i)%duration
        end do

        close(1)

    end function


end module

module RawTableL
    use Table
    implicit none
    contains

    function GetTheLines(source, lines) result(the_lines)
        integer :: lines, the_lines, i
        type(DataTable), dimension(lines) :: source

        the_lines=0

        do i=1, lines, 1
            the_lines=the_lines+source(i)%duration
        end do
    end function

end module

module DoRaw
    use Table
    implicit none
    contains

    function FilltheRaw(Source, lines) result(Temp)
        integer :: lines, i, j, counter
        type(DataTable), dimension(:), allocatable :: Source
        type(RawTable), dimension(lines) :: Temp

        counter=1
        do i=1, size(Source), 1
            do j=1, Source(i)%duration, 1
                if (j/=Source(i)%duration) then
                    Temp(counter)%volume=Source(i)%volume
                else
                    if (Source(i)%volume>0 .AND. Source(i)%volume==Source(i+1)%volume&
                    & .AND. Source(i)%channel==Source(i+1)%channel&
                    & .AND. Source(i)%note==Source(i+1)%note) then
                        Temp(counter)%volume=Source(i)%volume-1
                    else
                        Temp(counter)%volume=Source(i)%volume
                    endif
                endif
                Temp(counter)%channel=Source(i)%channel
                Temp(counter)%note=Source(i)%note
                !write(*,*) Temp(counter)
                counter=counter+1
            end do
        end do

    end function

end module

module Writer
    use Table
    implicit none
    contains

    function WriteOut(Channel1, Channel2, Channel3, Channel4) result(Output)
        type(RawTable), dimension(:), allocatable :: Channel1, Channel2, Channel3, Channel4, Output
        !character(6) :: path
        integer :: i, longest
        integer(kind=1) :: volume, channel, note, alloc_stat
        !logical :: exists

        longest=0
        if (allocated(Channel1) .EQV. .TRUE.) longest=size(Channel1)
        if (allocated(Channel2) .EQV. .TRUE.) then
            if (longest<size(Channel2)) longest=size(Channel2)
        end if
        if (allocated(Channel3) .EQV. .TRUE.) then
            if (longest<size(Channel3)) longest=size(Channel3)
        end if
        if (allocated(Channel4) .EQV. .TRUE.) then
            if (longest<size(Channel4)) longest=size(Channel4)
        end if

        !write(*,*) size(Channel1), size(Channel2), size(Channel3), size(Channel4), longest

        allocate(Output(longest), stat=alloc_stat)
        do i=1, longest, 1
            volume=0
            channel=0
            note=0

            if (allocated(Channel1)) then
                if (i<=size(Channel1) .AND. Channel1(i)%volume>0) then
                    volume=Channel1(i)%volume
                    channel=Channel1(i)%channel
                    note=Channel1(i)%note
                    goto 666
                end if
            end if

            if (allocated(Channel2)) then
                if (i<=size(Channel2) .AND. Channel2(i)%volume>0) then
                    volume=Channel2(i)%volume
                    channel=Channel2(i)%channel
                    note=Channel2(i)%note
                    goto 666
                end if
            end if

            if (allocated(Channel3)) then
                if (i<=size(Channel3) .AND. Channel3(i)%volume>0) then
                    volume=Channel3(i)%volume
                    channel=Channel3(i)%channel
                    note=Channel3(i)%note
                    goto 666
                end if
            end if

            if (allocated(Channel4)) then
                if (i<=size(Channel4) .AND. Channel4(i)%volume>0) then
                    volume=Channel4(i)%volume
                    channel=Channel4(i)%channel
                    note=Channel4(i)%note
                    goto 666
                end if
            end if

666         Output(i)%volume=volume
            Output(i)%channel=channel
            Output(i)%note=note

        end do


    end function
end module

module Writer2
    use Table
    implicit none
    contains

    subroutine WriteOut2 (Source, path)
        type(RawTable), dimension(:), allocatable :: Source
        integer :: counter, duration
        integer(kind=1) :: io
        character(6) :: path

        open(1, file=path, status="replace", iostat=io)

        counter=1
        do while(counter<size(Source))
            duration=1
            do while(Source(counter)%volume==Source(counter+duration)%volume .AND. &
            &Source(counter)%channel==Source(counter+duration)%channel .AND.&
            &Source(counter)%note==Source(counter+duration)%note .AND. duration<255)
                duration=duration+1
            end do

            write(1, "(I2,1x,I2,1x,I2,1x,I4)") Source(counter)%volume, Source(counter)%channel, Source(counter)%note, duration

            counter=counter+duration
        end do
        close(1)

    end subroutine

end module

module Writer3
    implicit none
    contains

    subroutine WriteOut3 (path)
        character(6) :: path
        integer(kind=2), dimension(:,:), allocatable :: Table_In
        integer(kind=1) :: io, alloc_stat
        integer :: lines, i
        character :: waste

        lines=0
        open(1, file=path, status="old", iostat=io)
        do
            read(1, *, iostat=io) waste
            if (io/=0) exit
            lines=lines+1
        end do

        allocate(Table_In(4, lines), stat=alloc_stat)

        rewind(1)

        do i=1, lines, 1
            read(1, *) Table_In(1, i), Table_In(2, i), Table_In(3, i), Table_In(4, i)
        end do

        close(1)


        open(1, file=path, status="replace", iostat=io)
        i=1
        do while(i<=lines)
            if (Table_In(1,i)==Table_In(1,i+1)+1 .AND. Table_In(2,i)==Table_In(2,i+1) .AND.&
            & Table_In(3,i)==Table_In(3,i+1) .AND. Table_In(4,i+1)==1) then
              write(1, "(I2, 1x, I2, 1x, I2, 1x, I4)") Table_In(1,i), Table_In(2,i), Table_In(3,i), (Table_In(4,i)+1)
              i=i+1
            else
              write(1, "(I2, 1x, I2, 1x, I2, 1x, I4)") Table_In(1,i), Table_In(2,i), Table_In(3,i), Table_In(4,i)
            end if


            i=i+1
        end do

        close(1)

    end subroutine


end module

module BitMaster
    implicit none
    contains

    subroutine Bit (path)
        character(6) :: path
        integer(kind=2), dimension(:,:), allocatable :: Table_In
        integer(kind=1) :: io, alloc_stat
        integer :: lines, i,j
        character :: waste
        character(8) :: volume_bin, channel_bin

        lines=0
        open(1, file=path, status="old", iostat=io)
        do
            read(1, *, iostat=io) waste
            if (io/=0) exit
            lines=lines+1
        end do

        allocate(Table_In(4, lines), stat=alloc_stat)

        rewind(1)

        do i=1, lines, 1
            read(1, *) Table_In(1, i), Table_In(2, i), Table_In(3, i), Table_In(4, i)
        end do

        close(1)
        open(1, file=path, status="replace", iostat=io)

        do i=1, lines, 1
            if (Table_In(1,i)==0) then
                write(1,"(T4, A, I0)") ".byte #", 0
                write(1,"(T4, A, I0)") ".byte #", Table_In(4,i)


            else
                write(volume_bin,"(B8)") Table_In(1,i)
                do j=1, 8, 1
                    if (volume_bin(j:j)==" ") volume_bin(j:j)="0"
                end do

                write(channel_bin,"(B8)") Table_In(2,i)
                do j=1, 8, 1
                    if (channel_bin(j:j)==" ") channel_bin(j:j)="0"
                end do

                write(1,"(T4, A, A)") ".byte #%", (channel_bin(5:8)//volume_bin(5:8))
                write(1,"(T4, A, I0)") ".byte #", Table_In(3,i)
                write(1,"(T4, A, I0)") ".byte #", Table_In(4,i)


            end if
        end do
        close(1)
    end subroutine

end module

program Mixer
    use Table
    use Lines
    use Fill
    use RawTableL
    use DoRaw
    use Writer
    use Writer2
    use Writer3
    use BitMaster

    implicit none
    type(DataTable), dimension(:), allocatable :: C0_1, C0_2, C0_3, C0_4, C1_1, C1_2, C1_3, C1_4
    type(RawTable), dimension(:), allocatable :: RC0_1, RC0_2, RC0_3, RC0_4, RC1_1, RC1_2, RC1_3, RC1_4, R0, R1
    character(8) :: path
    integer(kind=1) :: i, j, alloc_stat
    logical :: exists

    do i=0, 1, 1
        do j=1,4,1
            write(path, "(A1,I1,A1,I1,A4)") "C", i, "_", j, ".txt"

            inquire(file=path, exist=exists)
            if (exists .EQV. .FALSE.) cycle

            if (i==0) then
                select case(j)
                    case(1)
                        allocate(C0_1(GetLines(path)), stat=alloc_stat)
                        C0_1=Filler(path, size(C0_1))
                        allocate(RC0_1(GetTheLines(C0_1, size(C0_1))), stat=alloc_stat)
                        RC0_1=FilltheRaw(C0_1, size(RC0_1))
                    case(2)
                        allocate(C0_2(GetLines(path)), stat=alloc_stat)
                        C0_2=Filler(path, size(C0_2))
                        allocate(RC0_2(GetTheLines(C0_2, size(C0_2))), stat=alloc_stat)
                        RC0_2=FilltheRaw(C0_2, size(RC0_2))
                    case(3)
                        allocate(C0_3(GetLines(path)), stat=alloc_stat)
                        C0_3=Filler(path, size(C0_3))
                        allocate(RC0_3(GetTheLines(C0_3, size(C0_3))), stat=alloc_stat)
                        RC0_3=FilltheRaw(C0_3, size(RC0_3))
                    case(4)
                        allocate(C0_4(GetLines(path)), stat=alloc_stat)
                        C0_4=Filler(path, size(C0_4))
                        allocate(RC0_4(GetTheLines(C0_4, size(C0_4))), stat=alloc_stat)
                        RC0_4=FilltheRaw(C0_4, size(RC0_4))
                end select
            else
                select case(j)
                    case(1)
                        allocate(C1_1(GetLines(path)), stat=alloc_stat)
                        C1_1=Filler(path, size(C1_1))
                        allocate(RC1_1(GetTheLines(C1_1, size(C1_1))), stat=alloc_stat)
                        RC1_1=FilltheRaw(C1_1, size(RC1_1))
                    case(2)
                        allocate(C1_2(GetLines(path)), stat=alloc_stat)
                        C1_2=Filler(path, size(C1_2))
                        allocate(RC1_2(GetTheLines(C1_2, size(C1_2))), stat=alloc_stat)
                        RC1_2=FilltheRaw(C1_2, size(RC1_2))
                    case(3)
                        allocate(C1_3(GetLines(path)), stat=alloc_stat)
                        C1_3=Filler(path, size(C1_3))
                        allocate(RC1_3(GetTheLines(C1_3, size(C1_3))), stat=alloc_stat)
                        RC1_3=FilltheRaw(C1_3, size(RC1_3))
                    case(4)
                        allocate(C1_4(GetLines(path)), stat=alloc_stat)
                        C1_4=Filler(path, size(C1_4))
                        allocate(RC1_4(GetTheLines(C1_4, size(C1_4))), stat=alloc_stat)
                        RC1_4=FilltheRaw(C1_4, size(RC1_4))
                end select

            end if

        end do
    end do


    R0=WriteOut(RC0_1, RC0_2, RC0_3, RC0_4)
    R1=WriteOut(RC1_1, RC1_2, RC1_3, RC1_4)
    call WriteOut2(R0, "C0.txt")
    call WriteOut2(R1, "C1.txt")

    call WriteOut3("C0.txt")
    call Bit("C0.txt")
    call WriteOut3("C1.txt")
    call Bit("C1.txt")

end program

