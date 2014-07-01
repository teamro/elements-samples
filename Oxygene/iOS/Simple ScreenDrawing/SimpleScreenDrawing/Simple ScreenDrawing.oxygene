﻿<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <RootNamespace>SimpleScreenDrawing</RootNamespace>
    <ProjectGuid>{51d21307-4476-4461-a6df-1b05644e87d5}</ProjectGuid>
    <OutputType>Executable</OutputType>
    <AssemblyName>SimpleScreenDrawing</AssemblyName>
    <AllowGlobals>False</AllowGlobals>
    <AllowLegacyWith>False</AllowLegacyWith>
    <AllowLegacyOutParams>False</AllowLegacyOutParams>
    <AllowLegacyCreate>False</AllowLegacyCreate>
    <AllowUnsafeCode>False</AllowUnsafeCode>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <SDK>iOS</SDK>
    <CreateAppBundle>True</CreateAppBundle>
    <InfoPListFile>.\Resources\Info.plist</InfoPListFile>
    <DeploymentTargetVersion>
    </DeploymentTargetVersion>
    <Name>Simple ScreenDrawing</Name>
    <DefaultUses />
    <StartupClass />
    <CreateHeaderFile>False</CreateHeaderFile>
    <BundleExtension />
    <BundleIdentifier>org.me.SimpleScreenDrawing</BundleIdentifier>
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
    <Compile Include="Classes\JWAScreenDrawingView.pas" />
    <Compile Include="Program.pas" />
    <Compile Include="RootViewController.pas" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Resources\Info.plist" />
    <AppResource Include="Resources\App Icons\App-29.png" />
    <AppResource Include="Resources\App Icons\App-48.png" />
    <AppResource Include="Resources\App Icons\App-57.png" />
    <AppResource Include="Resources\App Icons\App-58.png" />
    <AppResource Include="Resources\App Icons\App-96.png" />
    <AppResource Include="Resources\App Icons\App-114.png" />
    <None Include="Resources\App Icons\App-512.png" />
    <None Include="Resources\App Icons\App-1024.png" />
    <AppResource Include="Resources\Launch Images\Default.png" />
    <AppResource Include="Resources\Launch Images\Default@2x.png" />
    <AppResource Include="Resources\Launch Images\Default-568h@2x.png" />
  </ItemGroup>
  <ItemGroup>
    <Xib Include="RootViewController.xib" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Classes" />
    <Folder Include="Properties\" />
    <Folder Include="Resources\" />
    <Folder Include="Resources\App Icons\" />
    <Folder Include="Resources\Launch Images\" />
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Nougat.targets" />
  <PropertyGroup>
    <PreBuildEvent />
  </PropertyGroup>
</Project>