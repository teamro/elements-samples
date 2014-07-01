﻿<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <RootNamespace>SimpleDatePicker</RootNamespace>
    <ProjectGuid>{de17260f-4e0e-4e44-9b89-4d63a39f5637}</ProjectGuid>
    <OutputType>executable</OutputType>
    <AssemblyName>SimpleDatePicker</AssemblyName>
    <AllowGlobals>False</AllowGlobals>
    <AllowLegacyWith>False</AllowLegacyWith>
    <AllowLegacyOutParams>False</AllowLegacyOutParams>
    <AllowLegacyCreate>False</AllowLegacyCreate>
    <AllowUnsafeCode>False</AllowUnsafeCode>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <SDK>iOS</SDK>
    <CreateAppBundle>True</CreateAppBundle>
    <InfoPListFile>.\Resources\Info.plist</InfoPListFile>
    <Name>SimpleDatePicker</Name>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <Optimize>false</Optimize>
    <OutputPath>.\bin\Debug</OutputPath>
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <GenerateDebugInfo>True</GenerateDebugInfo>
    <EnableAsserts>True</EnableAsserts>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <Optimize>true</Optimize>
    <OutputPath>.\bin\Release</OutputPath>
    <GenerateDebugInfo>False</GenerateDebugInfo>
    <EnableAsserts>False</EnableAsserts>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
    <CreateIPA>True</CreateIPA>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="CoreGraphics.fx" />
    <Reference Include="Foundation.fx" />
    <Reference Include="UIKit.fx" />
    <Reference Include="rtl.fx" />
    <Reference Include="libNougat.fx" />
  </ItemGroup>
  <ItemGroup>
    <Compile Include="AppDelegate.pas" />
    <Compile Include="JWADatePicker Helper\JWADatePicker.pas" />
    <Compile Include="Program.pas" />
    <Compile Include="StaticTableViewController.pas" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Resources\Info.plist" />
    <AppResource Include="Resources\App Icons\App-29.png" />
    <AppResource Include="Resources\App Icons\App-48.png" />
    <AppResource Include="Resources\App Icons\App-57.png" />
    <AppResource Include="Resources\App Icons\App-58.png" />
    <AppResource Include="Resources\App Icons\App-80.png" />
    <AppResource Include="Resources\App Icons\App-96.png" />
    <AppResource Include="Resources\App Icons\App-114.png" />
    <AppResource Include="Resources\App Icons\App-120.png" />
    <None Include="Resources\App Icons\App-512.png" />
    <None Include="Resources\App Icons\App-1024.png" />
    <AppResource Include="Resources\Launch Images\Default.png" />
    <AppResource Include="Resources\Launch Images\Default@2x.png" />
    <AppResource Include="Resources\Launch Images\Default-568h@2x.png" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="JWADatePicker Helper" />
    <Folder Include="Properties\" />
    <Folder Include="Resources\" />
    <Folder Include="Resources\App Icons\" />
    <Folder Include="Resources\Launch Images\" />
  </ItemGroup>
  <ItemGroup>
    <Storyboard Include="Resources\Storyboard.storyboard" />
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Nougat.targets" />
  <PropertyGroup>
    <PreBuildEvent />
  </PropertyGroup>
</Project>