<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <ProductVersion>3.5</ProductVersion>
    <ProjectGuid>{9d6d09c7-2c9e-4e67-abbf-8cfeaf30bade}</ProjectGuid>
    <OutputType>Library</OutputType>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <AllowLegacyCreate>False</AllowLegacyCreate>
    <Name>com.remobjects.cardview</Name>
    <RootNamespace>com.remobjects.cardview</RootNamespace>
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
    <Folder Include="res\values-v21" />
    <Folder Include="res\values-v11" />
    <Folder Include="res\values-sw600dp" />
    <Folder Include="res\values\" />
    <Folder Include="res\layout\" />
  </ItemGroup>
  <ItemGroup>
    <AndroidResource Include="res\layout\activity_card_view.layout-xml" />
    <AndroidResource Include="res\layout\cardviewfragment.layout-xml" />
    <AndroidResource Include="res\values-sw600dp\template-dimens.android-xml" />
    <AndroidResource Include="res\values-sw600dp\template-styles.android-xml" />
    <AndroidResource Include="res\values-v11\template-styles.android-xml" />
    <AndroidResource Include="res\values-v21\template-styles.android-xml" />
    <AndroidResource Include="res\values\colors.android-xml" />
    <AndroidResource Include="res\values\dimens.android-xml" />
    <AndroidResource Include="res\values\strings.android-xml">
      <SubType>Content</SubType>
    </AndroidResource>
    <AndroidResource Include="res\layout\main.layout-xml">
      <SubType>Content</SubType>
    </AndroidResource>
    <AndroidResource Include="res\values\template-dimens.android-xml" />
    <AndroidResource Include="res\values\template-styles.android-xml" />
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
    <Reference Include="android-support-v7-cardview.jar">
      <HintPath>C:\Users\Sven\AppData\Local\Android\android-sdk\extras\android\support\v7\cardview\libs\android-support-v7-cardview.jar</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="android.jar" />
    <Reference Include="com.remobjects.elements.rtl.jar">
      <HintPath>com.remobjects.elements.rtl.jar</HintPath>
      <Private>True</Private>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="CardViewFragment.pas" />
    <Compile Include="MainActivity.pas" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="res\drawable-hdpi\tile.9.png">
      <SubType>Content</SubType>
    </Content>
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Cooper.Android.targets" />
  <PropertyGroup>
    <PreBuildEvent />
  </PropertyGroup>
</Project>