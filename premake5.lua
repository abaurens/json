-- json

project "json"
  kind "StaticLib"
  language "C++"
  cppdialect "C++17"
  staticruntime "On"
  systemversion "latest"

  targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
  objdir ("%{wks.location}/build/" .. outputdir .. "%{prj.name}")

  IncludeDir["json"] = "%{wks.location}/libs/json/include"

  includedirs {
    "%{IncludeDir.json}"
  }

  files {
    "premake5.lua",
    "include/**.hpp",
  }

  filter "system:linux"
    pic "On"
  
  filter "system:macosx"
    pic "On"

  filter "configurations:Debug"
    runtime "Debug"
    symbols "On"

  filter "configurations:Release"
    runtime "Release"
    optimize "On"
