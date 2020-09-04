module Buzzer

    use FileTypes
    implicit none
    contains

    subroutine BuzzBuzz (NormalTable, PlusTable)
        type(NoteTable), dimension(59), intent(inout) :: NormalTable
        type(NoteTable), dimension(29), intent(inout) :: PlusTable
        integer(kind=1) :: i

        do i=1, 59, 1
            if (NormalTable(i)%AtariChannel==6) NormalTable(i)%AtariChannel=7
        end do
        do i=1, 29, 1
            if (PlusTable(i)%AtariChannel==6) PlusTable(i)%AtariChannel=7
        end do

    end subroutine

end module

module FileTypes
    implicit none
    type NoteTable
        integer(kind=2) :: MidiNote, AtariNote, AtariChannel
    end type

    type The_List
        integer :: volume, channel, note, duration

    end type

end module

module LoadTable


    use FileTypes
    implicit none

    contains
    function Load(path, lines) result(temptable)
        type(NoteTable), dimension(lines) :: temptable
        character(:), allocatable :: path
        integer(kind=1) :: io
        integer(kind=2) :: i
        integer :: lines


        open(1, file=path, status="old", iostat=io)

        do i=1, lines, 1
            read(1, *, iostat=io) temptable(i)%MidiNote, temptable(i)%AtariNote, temptable(i)%AtariChannel

            if (io/=0) exit
        end do
        close(1)
    end function


end module

Module ForceChannel
    implicit none
    contains

    function Forcer(note) result(channel)
        integer :: note, channel

        if (note<36) then
            channel=0
        else if (note<52) then
            channel=1
        else if (note<71) then
            channel=2
        else
            channel=3
        end if
    end function
End Module

module GetLinesNumber
    use ForceChannel
    implicit none

    contains

    function GetLines(path, the_channel, Force) result(lines)
        character(:), allocatable :: path
        integer :: io, note_on, the_channel, channel, note
        integer(kind=1) :: Force
        integer, dimension(2) :: lines
        character :: waste

        open(1, file=path, status="old", iostat=io)
        lines(1)=0
        lines(2)=1
        read(1,*, iostat=io) waste
        do
            read(1,*, iostat=io) note_on, waste, channel, note, waste
            if (io/=0) exit
            if (Force==1) channel=Forcer(note)



            if (note_on/=2 .AND. channel==the_channel) lines(1)=lines(1)+1
            lines(2)=lines(2)+1
        end do


        close(1)



    end function

end module


module LoadDuration
    use FileTypes
    use ForceChannel
    implicit none
    contains



    function DLoad(path, the_size, lines, the_channel, Force, Tempo) result(templist)
        integer :: the_size, i, note_on, lines, io, the_channel, channel, counter, note
        real(kind=8) :: duration, duration_collect, remainder
        integer(kind=1) :: Force, Tempo
        character(:), allocatable :: path
        type(The_List), dimension(the_size) :: templist
        character :: waste


        counter=1
        duration_collect=0

        open(1, file=path, status="old", iostat=io)
        read(1,*) waste


        do i=1, lines-1, 1
            read(1, *, iostat=io) note_on, waste, channel, note, duration
            duration_collect=duration_collect+duration
            if (Force==1) channel=Forcer(note)



            if (note_on/=2 .AND. channel==the_channel) then

                remainder=(duration_collect*Tempo-floor(duration_collect*Tempo))/Tempo
                templist(counter)%duration=floor(duration_collect*Tempo)

                if (channel==0) write(*,*) counter, templist(counter)%duration

                duration_collect=remainder
                counter=counter+1
            end if
        end do
        close(1)
    end function


end module

module Values
    use FileTypes
    use ForceChannel
    implicit none
    contains

    subroutine Add_Values(path, List_To_Save, the_channel, Force, Tempo, NormalTable, PlusTable, lines, note_changer, Buzz)
        type(NoteTable), dimension(59) :: NormalTable
        type(NoteTable), dimension(29) :: PlusTable
        type(The_List), dimension(:), allocatable, intent(inout) :: List_To_Save
        integer :: note_on, io, the_channel, channel, counter, note, i, velocity, j, lines, note_changer
        real(kind=8) :: duration, duration_collect, remainder
        integer(kind=1) :: Force, Tempo, Buzz
        character(:), allocatable :: path
        character :: waste

        List_To_Save(1)%volume=0
        List_To_Save(1)%channel=0
        List_To_Save(1)%note=0

        counter=2

        open(1, file=path, status="old", iostat=io)
        read(1,*) waste

        do i=1, lines-1, 1


            read(1, *, iostat=io) note_on, velocity, channel, note, duration
            if (Force==1) channel=Forcer(note)

            !if (Buzz==1 .AND. channel==6) channel=7

            note=note+(note_changer*12)
            if (note<21) note=21
            if (note>108) note=108

            if (note_on/=2 .AND. channel==the_channel) then
                if (note_on==1) then

                    do j=1, 59, 1
                        if (NormalTable(j)%MidiNote==note) then
                            List_To_Save(counter)%channel=NormalTable(j)%AtariChannel
                            !if (Buzz==1 .AND. List_To_Save(counter)%channel==6) List_To_Save(counter)%channel=7
                            List_To_Save(counter)%note=NormalTable(j)%AtariNote
                            goto 6666
                        end if
                    end do

                    do j=1, 29, 1
                        if (PlusTable(j)%MidiNote==note) then
                            List_To_Save(counter)%channel=PlusTable(j)%AtariChannel
                            List_To_Save(counter)%note=PlusTable(j)%AtariNote
                            goto 6666
                        end if
                    end do

6666                if (velocity>0) then

                        if (List_To_Save(counter)%channel==4 .OR. List_To_Save(counter)%channel==12) then
                            List_To_Save(counter)%volume=4+floor(real(velocity)/12)
                        else
                            List_To_Save(counter)%volume=1+floor(real(velocity)/12)
                        end if
                    else
                        List_To_Save(counter)%volume=0
                        List_To_Save(counter)%channel=0
                        List_To_Save(counter)%note=0
                    endif
                else
                    List_To_Save(counter)%volume=0
                    List_To_Save(counter)%channel=0
                    List_To_Save(counter)%note=0

                end if
            counter=counter+1
            if (counter>size(List_To_Save)) exit
            end if
        end do
        close(1)

    end subroutine

end module

module Saver
    use FileTypes
    implicit none
    contains

    subroutine WriteOut(numberR, List_To_Save, NoteChanger)
        integer :: numberR, io, i, NoteChanger
        type(The_List), dimension(:), allocatable :: List_To_Save
        character(10) :: path

        write(path,"(I2,A2,I2,A4)") numberR, "__", NoteChanger, ".txt"

        open(1, file=trim(path), status="replace", iostat=io)
        do i=1, size(List_To_Save), 1
            if (List_To_Save(i)%duration/=0) write(1,"(I2,1x,I2,1x,I2,1x,I4)") List_To_Save(i)
        end do

        close(1)

    end subroutine

end module


program MidiConverter
    use FileTypes
    use LoadTable
    use LoadDuration
    use GetLinesNumber
    use Values
    use Saver
    use Buzzer

    implicit none

    type(NoteTable), dimension(59) :: NormalTable
    type(NoteTable), dimension(29) :: PlusTable
    type(The_List), dimension(:), allocatable :: List_To_Save

    character(:), allocatable :: path
    integer :: i, io, alloc_stat, j
    integer(kind=1) :: Tempo, Buzz, Force

    integer, dimension(2) :: sizes

    path="Includes/notes.txt"
    NormalTable=Load(path, 59)

    path="Includes/notes_plus.txt"
    PlusTable=Load(path, 29)

    !do i=1, 29, 1
    !    write(*,"(A1)", advance="no") " "
    !    write(*,*) PlusTable(i)
    !end do
    path="to_Fortran.txt"


    open(1, file=path, status="old", iostat=io)
    read(1, *) Tempo, Buzz, Force

    if (Buzz==1) call BuzzBuzz(NormalTable, PlusTable)

    do i=0,15,1



        if (allocated(List_To_Save)) deallocate(List_To_Save)

        sizes=GetLines(path, i, Force)

        allocate(List_To_Save(sizes(1)), stat=alloc_stat)

        List_To_Save%channel=0
        List_To_Save%volume=0
        List_To_Save%note=0
        List_To_Save%duration=0

        List_To_Save=DLoad(path, sizes(1), sizes(2), i, Force, Tempo)
        do j=1,5,1
            call Add_Values(path, List_To_Save, i, Force, Tempo, NormalTable, PlusTable, sizes(2), j-3, Buzz)
            if (size(List_To_Save)>0) call WriteOut(i, List_To_Save, j-3)
        end do

    end do
end program

