module OS_func
    use list
    use file_func
    use string_func
    implicit none

    private
    public :: getFilesFromSubFolder, getSep, getFileNameFromPath

    contains

    function getFilesFromSubFolder(os, dir) result(array)
        character(:), allocatable :: os, dir
        character(1000), dimension(:), allocatable :: array

        if (os == "Windows") then
            array = getFilesFromSubFolderWin(dir)


        end if

    end function

    function getFilesFromSubFolderWin(dir) result(array)
        character(:), allocatable :: dir, command, path
        character(10000), dimension(:), allocatable :: array
        integer :: alloc

        call system(command="dir "//dir//" /s /b /o:gn>filelist.txt")
        path = "filelist.txt"
        array = loadLines(path)

        call system(command="del filelist.txt")

        allocate(array(1), stat=alloc)

    end function

    function getSep(os_name) result(sep)
        character(len=:), allocatable :: os_name
        character(1) :: sep

        if (os_name=="Windows") then
            sep="\"
        else
            sep="/"
        end if

    end function

    function getFileNameFromPath(path, os, ext) result(filename)
        character(:), allocatable :: path, filename, os
        logical :: ext
        character(100), dimension(:), allocatable :: parts
        !Ext is about if you want to have the extension or don't.

        parts = split(path, getSep(os), 99999)
        filename = parts(size(parts))
        if (ext .EQV. .FALSE.) then
            parts = split(filename, ".", 2)
            filename = parts(1)
        end if

    end function

end module