file copy -force $::env(VERILOG_FILES) $::env(synthesis_results)/$::env(DESIGN_NAME).v
# TODO: the following statistics should be created with utopia
file copy -force [pwd]/designs/$::env(DESIGN_NAME)/src/1-synthesis.AREA_0.stat.rpt $::env(synthesis_reports)
