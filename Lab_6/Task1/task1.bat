wmic os get caption, version > version.txt
wmic computersystem get totalphysicalmemory > FreeAndTotalMemory.txt
wmic os get freephysicalmemory >> FreeAndTotalMemory.txt
wmic logicaldisk list brief > disks.txt

