//  Catapult Prime Synthesis 2022.1/981271 (Production Release) Thu Feb 10 22:05:20 PST 2022
//  
//          Copyright (c) Siemens EDA, 1996-2022, All Rights Reserved.
//                        UNPUBLISHED, LICENSED SOFTWARE.
//             CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//                   PROPERTY OF SIEMENS EDA OR ITS LICENSORS.
//  
//  Running on Linux wanwei.xiao@alish-rs-cs08.eng.t-head.cn 3.10.0-1160.66.1.el7.x86_64 x86_64 aol
//  
//  Package information: SIFLIBS v25.1_0.0, HLS_PKGS v25.1_0.0, 
//                       SIF_TOOLKITS v25.1_0.0, SIF_XILINX v25.1_0.0, 
//                       SIF_ALTERA v25.1_0.0, CCS_LIBS v25.1_0.0, 
//                       CDS_PPRO v10.6, CDS_DesigChecker v2022.1, 
//                       CDS_OASYS v21.1_2.5, CDS_PSR v21.1_0.4, 
//                       DesignPad v2.78_1.0
//  
solution new -state initial
solution options defaults
solution options set /Input/CppStandard c++11
solution options set /Output/GenerateCycleNetlist false
solution options set /Flows/SCVerify/USE_QUESTASIM false
solution options set /Flows/SCVerify/USE_OSCI false
solution options set /Flows/SCVerify/USE_VCS true
solution options set /Flows/VCS/VG_ENV32_SCRIPT source_me_gcc483_32.csh
solution options set /Flows/VCS/VG_ENV64_SCRIPT source_me_gcc483_64.csh
solution options set /Flows/VCS/VLOGAN_OPTS {+v2k +no_tchk_msg -kdb -lca}
solution options set /Flows/VCS/VCSELAB_OPTS {-debug_acc+all -debug_region+cell+encrypt -timescale=1ps/1ps -sysc=blocksync -sysc=2.3.1 -sysc=slow_sc_main}
solution options set /Flows/VCS/SYSC_VERSION 2.3.1
flow package require /SCVerify
solution file add ../src/rawdns.h -type CHEADER -exclude true
solution file add ../src/rawdns.cpp -type C++
solution file add ../tb/tb_rawdns_catapult.cpp -type C++ -exclude true
directive set -DESIGN_GOAL area
directive set -SPECULATE true
directive set -MERGEABLE true
directive set -REGISTER_THRESHOLD 256
directive set -MEM_MAP_THRESHOLD 32
directive set -LOGIC_OPT false
directive set -FSM_ENCODING none
directive set -FSM_BINARY_ENCODING_THRESHOLD 64
directive set -REG_MAX_FANOUT 0
directive set -NO_X_ASSIGNMENTS true
directive set -SAFE_FSM false
directive set -REGISTER_SHARING_MAX_WIDTH_DIFFERENCE 8
directive set -REGISTER_SHARING_LIMIT 0
directive set -ASSIGN_OVERHEAD 0
directive set -TIMING_CHECKS true
directive set -MUXPATH true
directive set -REALLOC true
directive set -UNROLL no
directive set -IO_MODE super
directive set -CHAN_IO_PROTOCOL use_library
directive set -ARRAY_SIZE 1024
directive set -IDLE_SIGNAL {}
directive set -STALL_FLAG_SV off
directive set -STALL_FLAG false
directive set -TRANSACTION_DONE_SIGNAL true
directive set -DONE_FLAG {}
directive set -READY_FLAG {}
directive set -START_FLAG {}
directive set -TRANSACTION_SYNC ready
directive set -RESET_CLEARS_ALL_REGS use_library
directive set -CLOCK_OVERHEAD 20.000000
directive set -OPT_CONST_MULTS use_library
directive set -CHARACTERIZE_ROM false
directive set -PROTOTYPE_ROM true
directive set -ROM_THRESHOLD 64
directive set -CLUSTER_ADDTREE_IN_WIDTH_THRESHOLD 0
directive set -CLUSTER_ADDTREE_IN_COUNT_THRESHOLD 0
directive set -CLUSTER_OPT_CONSTANT_INPUTS true
directive set -CLUSTER_RTL_SYN false
directive set -CLUSTER_FAST_MODE false
directive set -CLUSTER_TYPE combinational
directive set -PROTOTYPING_ENGINE oasys
directive set -PIPELINE_RAMP_UP true
go new
solution design set isp_rawdns -top
solution design set ac::fx_div<8> -block
go analyze
solution design set isp_rawdns -top
solution design set ac::fx_div<8> -block
solution design set rawdns_process -block
solution design set rawdns_process -top
solution design set isp_rawdns -block
go compile
solution library add nangate-45nm_beh -- -rtlsyntool DesignCompiler -vendor Nangate -technology 045nm
go libraries
solution design set rawdns_process -ccore
directive set -CLOCKS {clk {-CLOCK_PERIOD 3.33 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 1.665 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /rawdns_process/core/main -PIPELINE_INIT_INTERVAL 1
directive set /rawdns_process/core/for -UNROLL yes
directive set /rawdns_process/core/for:for -UNROLL yes
directive set /rawdns_process/core/Cal_Eur_Distance:for -UNROLL yes
directive set /rawdns_process/core/Cal_Eur_Distance:for:for -UNROLL yes
directive set /rawdns_process/core/Cal_Eur_Distance:for#1 -UNROLL yes
directive set /rawdns_process/core/Cal_Eur_Distance:for#1:for -UNROLL yes
directive set /rawdns_process/core/ac_math::ac_div<25,13,25,13>:for -UNROLL yes
go architect
go extract
//  Catapult Prime Synthesis 2022.1/981271 (Production Release) Thu Feb 10 22:05:20 PST 2022
//  
//          Copyright (c) Siemens EDA, 1996-2022, All Rights Reserved.
//                        UNPUBLISHED, LICENSED SOFTWARE.
//             CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//                   PROPERTY OF SIEMENS EDA OR ITS LICENSORS.
//  
//  Running on Linux wanwei.xiao@alish-rs-cs08.eng.t-head.cn 3.10.0-1160.66.1.el7.x86_64 x86_64 aol
//  
//  Package information: SIFLIBS v25.1_0.0, HLS_PKGS v25.1_0.0, 
//                       SIF_TOOLKITS v25.1_0.0, SIF_XILINX v25.1_0.0, 
//                       SIF_ALTERA v25.1_0.0, CCS_LIBS v25.1_0.0, 
//                       CDS_PPRO v10.6, CDS_DesigChecker v2022.1, 
//                       CDS_OASYS v21.1_2.5, CDS_PSR v21.1_0.4, 
//                       DesignPad v2.78_1.0
//  
solution new -state initial
solution options defaults
solution options set /Input/CppStandard c++11
solution options set /Output/GenerateCycleNetlist false
solution options set /Flows/SCVerify/USE_QUESTASIM false
solution options set /Flows/SCVerify/USE_OSCI false
solution options set /Flows/SCVerify/USE_VCS true
solution options set /Flows/VCS/VG_ENV32_SCRIPT source_me_gcc483_32.csh
solution options set /Flows/VCS/VG_ENV64_SCRIPT source_me_gcc483_64.csh
solution options set /Flows/VCS/VLOGAN_OPTS {+v2k +no_tchk_msg -kdb -lca}
solution options set /Flows/VCS/VCSELAB_OPTS {-debug_acc+all -debug_region+cell+encrypt -timescale=1ps/1ps -sysc=blocksync -sysc=2.3.1 -sysc=slow_sc_main}
solution options set /Flows/VCS/SYSC_VERSION 2.3.1
flow package require /SCVerify
solution file add ../src/rawdns.h -type CHEADER -exclude true
solution file add ../src/rawdns.cpp -type C++
solution file add ../tb/tb_rawdns.cpp -type C++ -exclude true
directive set -DESIGN_GOAL area
directive set -SPECULATE true
directive set -MERGEABLE true
directive set -REGISTER_THRESHOLD 256
directive set -MEM_MAP_THRESHOLD 32
directive set -LOGIC_OPT false
directive set -FSM_ENCODING none
directive set -FSM_BINARY_ENCODING_THRESHOLD 64
directive set -REG_MAX_FANOUT 0
directive set -NO_X_ASSIGNMENTS true
directive set -SAFE_FSM false
directive set -REGISTER_SHARING_MAX_WIDTH_DIFFERENCE 8
directive set -REGISTER_SHARING_LIMIT 0
directive set -ASSIGN_OVERHEAD 0
directive set -TIMING_CHECKS true
directive set -MUXPATH true
directive set -REALLOC true
directive set -UNROLL no
directive set -IO_MODE super
directive set -CHAN_IO_PROTOCOL use_library
directive set -ARRAY_SIZE 1024
directive set -IDLE_SIGNAL {}
directive set -STALL_FLAG_SV off
directive set -STALL_FLAG false
directive set -TRANSACTION_DONE_SIGNAL true
directive set -DONE_FLAG {}
directive set -READY_FLAG {}
directive set -START_FLAG {}
directive set -TRANSACTION_SYNC ready
directive set -RESET_CLEARS_ALL_REGS use_library
directive set -CLOCK_OVERHEAD 20.000000
directive set -OPT_CONST_MULTS use_library
directive set -CHARACTERIZE_ROM false
directive set -PROTOTYPE_ROM true
directive set -ROM_THRESHOLD 64
directive set -CLUSTER_ADDTREE_IN_WIDTH_THRESHOLD 0
directive set -CLUSTER_ADDTREE_IN_COUNT_THRESHOLD 0
directive set -CLUSTER_OPT_CONSTANT_INPUTS true
directive set -CLUSTER_RTL_SYN false
directive set -CLUSTER_FAST_MODE false
directive set -CLUSTER_TYPE combinational
directive set -PROTOTYPING_ENGINE oasys
directive set -PIPELINE_RAMP_UP true
go new
solution design set isp_rawdns -top
solution design set ac::fx_div<8> -block
go analyze
solution design set isp_rawdns -block
solution design set ac::fx_div<8> -block
solution design set rawdns_process -top -ccore
solution design set rawdns_process -block
solution design set isp_rawdns -top
go compile
solution library add nangate-45nm_beh -- -rtlsyntool DesignCompiler -vendor Nangate -technology 045nm
solution library add ccs_sample_mem
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 3.33 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 1.665 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /isp_rawdns/top_reg.frameWidth:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/top_reg.frameHeight:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/top_reg.inputFormat:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/top_reg.imgPattern:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/top_reg.pipeMode:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/top_reg.blc:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/top_reg.shadowEb:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/top_reg.binningFrameWidth:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/top_reg.binningFrameHeight:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/top_reg.scalerFrameWidth:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/top_reg.scalerFrameHeight:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/top_reg.ROW_TEST:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/top_reg.COL_TEST:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/rawdns_reg.sigma:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/rawdns_reg.eb:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/rawdns_reg.Filterpara:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/rawdns_reg.invksigma2:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /isp_rawdns/core/rawdns_lines:rsc -BLOCK_SIZE 8192
directive set /isp_rawdns/core/rawdns_block:rsc -MAP_TO_MODULE {[Register]}
directive set /isp_rawdns/core/main -PIPELINE_INIT_INTERVAL 1
directive set /isp_rawdns/core/pixel_loop -PIPELINE_INIT_INTERVAL 1
directive set /isp_rawdns/core/padding_loop1 -PIPELINE_INIT_INTERVAL 1
directive set /isp_rawdns/core/padding_loop2 -PIPELINE_INIT_INTERVAL 1
directive set /isp_rawdns/core/reg_refresh_out_loop -UNROLL yes
directive set /isp_rawdns/core/reg_refresh_inner_loop -UNROLL yes
directive set /isp_rawdns/core/pixel_loop:if#1:for -UNROLL yes
directive set /isp_rawdns/core/pixel_loop:if#1:for#1 -UNROLL yes
directive set /isp_rawdns/core/loop2_inner_loop -UNROLL no
go architect
directive set /isp_rawdns/core/pixel_loop:if#1:for:read_mem(rawdns_lines:rsc(1)(0).@) -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/pixel_loop:if#1:for:read_mem(rawdns_lines:rsc(2)(0).@)#1 -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/pixel_loop:if#1:for:read_mem(rawdns_lines:rsc(3)(0).@)#2 -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/pixel_loop:if#1:for:read_mem(rawdns_lines:rsc(4)(0).@)#3 -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/pixel_loop:if#1:for:read_mem(rawdns_lines:rsc(5)(0).@)#4 -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/pixel_loop:if#1:for:read_mem(rawdns_lines:rsc(6)(0).@)#5 -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/pixel_loop:if#1:for:read_mem(rawdns_lines:rsc(7)(0).@)#6 -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/pixel_loop:if#1:for:read_mem(rawdns_lines:rsc(8)(0).@)#7 -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/pixel_loop:if#1:for:read_mem(rawdns_lines:rsc(9)(0).@)#8 -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/pixel_loop:if#1:for:read_mem(rawdns_lines:rsc(0)(0).@)#9 -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/padding_loop1:read_mem(rawdns_lines:rsc(3)(0).@) -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/padding_loop1:read_mem(rawdns_lines:rsc(4)(0).@) -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/loop2_inner_loop:read_mem(rawdns_lines:rsc(5)(0).@) -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/loop2_inner_loop:read_mem(rawdns_lines:rsc(6)(0).@) -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/loop2_inner_loop:read_mem(rawdns_lines:rsc(7)(0).@) -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/loop2_inner_loop:read_mem(rawdns_lines:rsc(8)(0).@) -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
directive set /isp_rawdns/core/loop2_inner_loop:read_mem(rawdns_lines:rsc(9)(0).@) -IGNORE_DEPENDENCY_FROM {pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(0)(0).@) pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(1)(0).@)#1 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(2)(0).@)#2 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(3)(0).@)#3 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(4)(0).@)#4 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(5)(0).@)#5 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(6)(0).@)#6 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(7)(0).@)#7 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(8)(0).@)#8 pixel_loop:if#1:for#1:write_mem(rawdns_lines:rsc(9)(0).@)#9}
go allocate
go extract
