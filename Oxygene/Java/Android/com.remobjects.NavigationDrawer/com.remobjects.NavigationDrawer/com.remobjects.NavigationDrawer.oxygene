<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <ProductVersion>3.5</ProductVersion>
    <ProjectGuid>{34272682-af25-4160-9c72-67fa26907f43}</ProjectGuid>
    <OutputType>Library</OutputType>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <AllowLegacyCreate>False</AllowLegacyCreate>
    <Name>com.remobjects.navigationdrawer</Name>
    <RootNamespace>com.remobjects.navigationdrawer</RootNamespace>
    <AndroidPlatformName>android-16</AndroidPlatformName>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <Optimize>false</Optimize>
    <OutputPath>.\bin\Debug</OutputPath>
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <GenerateDebugInfo>True</GenerateDebugInfo>
    <EnableAsserts>True</EnableAsserts>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
    <RegisterForComInterop>False</RegisterForComInterop>
    <CpuType>anycpu</CpuType>
    <RuntimeVersion>v25</RuntimeVersion>
    <XmlDoc>False</XmlDoc>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
    <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <Optimize>true</Optimize>
    <OutputPath>.\bin\Release</OutputPath>
    <GenerateDebugInfo>False</GenerateDebugInfo>
    <EnableAsserts>False</EnableAsserts>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
    <RegisterForComInterop>False</RegisterForComInterop>
    <CpuType>anycpu</CpuType>
    <RuntimeVersion>v25</RuntimeVersion>
    <XmlDoc>False</XmlDoc>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <ItemGroup>
    <Folder Include="Properties\" />
    <Folder Include="res\" />
    <Folder Include="res\drawable-hdpi\" />
    <Folder Include="res\drawable-ldpi\" />
    <Folder Include="res\drawable-mdpi\" />
    <Folder Include="res\drawable-xhdpi\" />
    <Folder Include="res\drawable\" />
    <Folder Include="res\menu" />
    <Folder Include="res\values\" />
    <Folder Include="res\layout\" />
  </ItemGroup>
  <ItemGroup>
    <AndroidResource Include="res\layout\drawer_list_item.layout-xml" />
    <AndroidResource Include="res\layout\fragment_planet.layout-xml" />
    <AndroidResource Include="res\menu\menu.android-xml" />
    <AndroidResource Include="res\values\strings.android-xml">
      <SubType>Content</SubType>
    </AndroidResource>
    <AndroidResource Include="res\layout\main.layout-xml">
      <SubType>Content</SubType>
    </AndroidResource>
    <None Include="res\drawable-hdpi\icon.png">
      <SubType>Content</SubType>
    </None>
    <None Include="res\drawable-mdpi\icon.png">
      <SubType>Content</SubType>
    </None>
    <None Include="res\drawable-ldpi\icon.png">
      <SubType>Content</SubType>
    </None>
    <None Include="res\drawable-xhdpi\icon.png">
      <SubType>Content</SubType>
    </None>
  </ItemGroup>
  <ItemGroup>
    <AndroidManifest Include="Properties\AndroidManifest.android-xml" />
  </ItemGroup>
  <ItemGroup>
    <Reference Include="android-support-v4.jar">
      <HintPath>C:\Users\Sven\AppData\Local\Android\android-sdk\extras\android\support\v4\android-support-v4.jar</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="android.jar" />
  </ItemGroup>
  <ItemGroup>
    <Compile Include="MainActivity.pas" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="res\drawable-hdpi\action_search.png">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable-hdpi\drawer_shadow.9.png">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable-hdpi\ic_drawer.png">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable-mdpi\action_search.png">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable-mdpi\drawer_shadow.9.png">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable-mdpi\ic_drawer.png">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable-xhdpi\action_search.png">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable-xhdpi\drawer_shadow.9.png">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable-xhdpi\ic_drawer.png">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable\earth.jpg">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable\jupiter.jpg">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable\mars.jpg">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable\mercury.jpg">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable\neptune.jpg">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable\saturn.jpg">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable\uranus.jpg">
      <SubType>Content</SubType>
    </Content>
    <Content Include="res\drawable\venus.jpg">
      <SubType>Content</SubType>
    </Content>
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Cooper.Android.targets" />
  <PropertyGroup>
    <PreBuildEvent />
  </PropertyGroup>
</Project>