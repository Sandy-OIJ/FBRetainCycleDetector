Pod::Spec.new do |s|
  s.name         = "FBRetainCycleDetector"
  s.version      = "1.0.1"
  s.summary      = "Library that helps with detecting retain cycles in iOS apps"
  s.homepage     = "https://github.com/Sandy-OIJ/FBRetainCycleDetector"
  s.license      = "BSD"
  s.author       = { "Sandy" => "Sandy@163.com" }
  s.platform     = :ios, "10.0"
  s.source       = {
    :git => "https://github.com/Sandy-OIJ/FBRetainCycleDetector.git", :tag => s.version
  }
  s.source_files  = "FBRetainCycleDetector", "{FBRetainCycleDetector,rcd_fishhook}/**/*.{h,m,mm,c}"

  mrr_files = [
    'FBRetainCycleDetector/Associations/FBAssociationManager.h',
    'FBRetainCycleDetector/Associations/FBAssociationManager.mm',
    'FBRetainCycleDetector/Layout/Blocks/FBBlockStrongLayout.h',
    'FBRetainCycleDetector/Layout/Blocks/FBBlockStrongLayout.m',
    'FBRetainCycleDetector/Layout/Blocks/FBBlockStrongRelationDetector.h',
    'FBRetainCycleDetector/Layout/Blocks/FBBlockStrongRelationDetector.m',
    'FBRetainCycleDetector/Layout/Classes/FBClassStrongLayoutHelpers.h',
    'FBRetainCycleDetector/Layout/Classes/FBClassStrongLayoutHelpers.m',
  ]

  files = Pathname.glob("FBRetainCycleDetector/**/*.{h,m,mm}")
  files = files.map {|file| file.to_path}
  files = files.reject {|file| mrr_files.include?(file)}

  s.requires_arc = files.sort + [
    'rcd_fishhook/**/*.{c,h}'
  ]
  s.public_header_files = [
    'FBRetainCycleDetector/Detector/FBRetainCycleDetector.h',
    'FBRetainCycleDetector/Associations/FBAssociationManager.h',
    'FBRetainCycleDetector/Graph/FBObjectiveCBlock.h',
    'FBRetainCycleDetector/Graph/FBObjectiveCGraphElement.h',
    'FBRetainCycleDetector/Graph/Specialization/FBObjectiveCNSCFTimer.h',
    'FBRetainCycleDetector/Graph/FBObjectiveCObject.h',
    'FBRetainCycleDetector/Graph/FBObjectGraphConfiguration.h',
    'FBRetainCycleDetector/Filtering/FBStandardGraphEdgeFilters.h',
  ]

  s.framework = "Foundation", "CoreGraphics", "UIKit"
  s.library = 'c++'
end
