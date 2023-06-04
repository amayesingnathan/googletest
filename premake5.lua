project "gtest"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
		
    targetdir 	("%{wks.location}/bin/%{prj.name}/" .. outputDir)
    objdir 		("%{wks.location}/obj/%{prj.name}/" .. outputDir)

    files 
    { 
        "googletest/include/**.h",
        "googletest/src/**.h",
        "googletest/src/**.cc",
    }

    removefiles 
    { 
        "googletest/src/gtest-all.cc",
    }
	
	includedirs
	{
		"googletest",
		"googletest/include",
	}

    filter "system:windows"
        systemversion "latest"
        
	filter "system:linux"
		pic "On"
		systemversion "latest"
      
    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"