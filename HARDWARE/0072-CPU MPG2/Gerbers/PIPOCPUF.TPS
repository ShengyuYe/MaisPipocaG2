G04*
G04  File:            PIPOCPUF.TPS, Sun Apr 16 23:03:51 2017*
G04  Source:          P-CAD 2006 PCB, Version 19.02.958, (C:\C\PlusArte\MAquino\PipoCPUF\PIPOCPUF.PCB)*
G04  Format:          Gerber Format (RS-274-D), ASCII*
G04*
G04  Format Options:  Absolute Positioning*
G04                   Leading-Zero Suppression*
G04                   Scale Factor 1:1*
G04                   NO Circular Interpolation*
G04                   Inch Units*
G04                   Numeric Format: 4.4 (XXXX.XXXX)*
G04                   G54 NOT Used for Aperture Change*
G04                   Apertures Embedded*
G04*
G04  File Options:    Offset = (0.0mil,0.0mil)*
G04                   Drill Symbol Size = 50.0mil*
G04                   No Pad/Via Holes*
G04*
G04  File Contents:   Pads*
G04                   No Vias*
G04                   No Designators*
G04                   No Types*
G04                   No Values*
G04                   No Drill Symbols*
G04                   Board*
G04                   Top Paste*
G04*
%INPIPOCPUF.TPS*%
%ICAS*%
%MOIN*%
G04*
G04  Aperture MACROs for general use --- invoked via D-code assignment *
G04*
G04  General MACRO for flashed round with rotation and/or offset hole *
%AMROTOFFROUND*
1,1,$1,0.0000,0.0000*
1,0,$2,$3,$4*%
G04*
G04  General MACRO for flashed oval (obround) with rotation and/or offset hole *
%AMROTOFFOVAL*
21,1,$1,$2,0.0000,0.0000,$3*
1,1,$4,$5,$6*
1,1,$4,0-$5,0-$6*
1,0,$7,$8,$9*%
G04*
G04  General MACRO for flashed oval (obround) with rotation and no hole *
%AMROTOVALNOHOLE*
21,1,$1,$2,0.0000,0.0000,$3*
1,1,$4,$5,$6*
1,1,$4,0-$5,0-$6*%
G04*
G04  General MACRO for flashed rectangle with rotation and/or offset hole *
%AMROTOFFRECT*
21,1,$1,$2,0.0000,0.0000,$3*
1,0,$4,$5,$6*%
G04*
G04  General MACRO for flashed rectangle with rotation and no hole *
%AMROTRECTNOHOLE*
21,1,$1,$2,0.0000,0.0000,$3*%
G04*
G04  General MACRO for flashed rounded-rectangle *
%AMROUNDRECT*
21,1,$1,$2-$4,0.0000,0.0000,$3*
21,1,$1-$4,$2,0.0000,0.0000,$3*
1,1,$4,$5,$6*
1,1,$4,$7,$8*
1,1,$4,0-$5,0-$6*
1,1,$4,0-$7,0-$8*
1,0,$9,$10,$11*%
G04*
G04  General MACRO for flashed rounded-rectangle with rotation and no hole *
%AMROUNDRECTNOHOLE*
21,1,$1,$2-$4,0.0000,0.0000,$3*
21,1,$1-$4,$2,0.0000,0.0000,$3*
1,1,$4,$5,$6*
1,1,$4,$7,$8*
1,1,$4,0-$5,0-$6*
1,1,$4,0-$7,0-$8*%
G04*
G04  General MACRO for flashed regular polygon *
%AMREGPOLY*
5,1,$1,0.0000,0.0000,$2,$3+$4*
1,0,$5,$6,$7*%
G04*
G04  General MACRO for flashed regular polygon with no hole *
%AMREGPOLYNOHOLE*
5,1,$1,0.0000,0.0000,$2,$3+$4*%
G04*
G04  General MACRO for target *
%AMTARGET*
6,0,0,$1,$2,$3,4,$4,$5,$6*%
G04*
G04  General MACRO for mounting hole *
%AMMTHOLE*
1,1,$1,0,0*
1,0,$2,0,0*
$1=$1-$2*
$1=$1/2*
21,1,$2+$1,$3,0,0,$4*
21,1,$3,$2+$1,0,0,$4*%
G04*
G04*
G04  D10 : "Ellipse X1.0mil Y1.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0010*
%ADD10C, 0.0010*%
G04  D11 : "Ellipse X10.0mil Y10.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0100*
%ADD11C, 0.0100*%
G04  D12 : "Ellipse X12.0mil Y12.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0120*
%ADD12C, 0.0120*%
G04  D13 : "Ellipse X120.0mil Y120.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.1200*
%ADD13C, 0.1200*%
G04  D14 : "Ellipse X14.0mil Y14.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0140*
%ADD14C, 0.0140*%
G04  D15 : "Ellipse X140.0mil Y140.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.1400*
%ADD15C, 0.1400*%
G04  D16 : "Ellipse X16.0mil Y16.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0160*
%ADD16C, 0.0160*%
G04  D17 : "Ellipse X18.0mil Y18.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0180*
%ADD17C, 0.0180*%
G04  D18 : "Ellipse X20.0mil Y20.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0200*
%ADD18C, 0.0200*%
G04  D19 : "Ellipse X21.0mil Y21.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0210*
%ADD19C, 0.0210*%
G04  D20 : "Ellipse X24.0mil Y24.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0240*
%ADD20C, 0.0240*%
G04  D21 : "Ellipse X30.0mil Y30.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0300*
%ADD21C, 0.0300*%
G04  D22 : "Ellipse X4.0mil Y4.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0040*
%ADD22C, 0.0040*%
G04  D23 : "Ellipse X40.0mil Y40.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0400*
%ADD23C, 0.0400*%
G04  D24 : "Ellipse X50.0mil Y50.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0500*
%ADD24C, 0.0500*%
G04  D25 : "Ellipse X7.0mil Y7.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0070*
%ADD25C, 0.0070*%
G04  D26 : "Ellipse X70.0mil Y70.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0700*
%ADD26C, 0.0700*%
G04  D27 : "Ellipse X8.0mil Y8.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0080*
%ADD27C, 0.0080*%
G04  D28 : "Ellipse X90.0mil Y90.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Draw"*
G04  Disc: OuterDia=0.0900*
%ADD28C, 0.0900*%
G04  D29 : "Ellipse X100.0mil Y100.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.1000*
%ADD29C, 0.1000*%
G04  D30 : "Ellipse X104.0mil Y104.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.1040*
%ADD30C, 0.1040*%
G04  D31 : "Ellipse X110.0mil Y110.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.1100*
%ADD31C, 0.1100*%
G04  D32 : "Ellipse X114.0mil Y114.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.1140*
%ADD32C, 0.1140*%
G04  D33 : "Ellipse X122.0mil Y122.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.1220*
%ADD33C, 0.1220*%
G04  D34 : "Ellipse X162.0mil Y162.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.1620*
%ADD34C, 0.1620*%
G04  D35 : "Ellipse X200.0mil Y200.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.2000*
%ADD35C, 0.2000*%
G04  D36 : "Ellipse X204.0mil Y204.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.2040*
%ADD36C, 0.2040*%
G04  D37 : "Ellipse X60.0mil Y60.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0600*
%ADD37C, 0.0600*%
G04  D38 : "Ellipse X64.0mil Y64.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0640*
%ADD38C, 0.0640*%
G04  D39 : "Ellipse X70.0mil Y80.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Irregular Polygon: DimX=0.0700, DimY=0.0800, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%AMIRREGPOLYD39*
4,1,16,
0.0350, 0.0000,
0.0323, 0.0153,
0.0247, 0.0283,
0.0134, 0.0370,
0.0000, 0.0400,
-0.0134, 0.0370,
-0.0247, 0.0283,
-0.0323, 0.0153,
-0.0350, 0.0000,
-0.0323, -0.0153,
-0.0247, -0.0283,
-0.0134, -0.0370,
0.0000, -0.0400,
0.0134, -0.0370,
0.0247, -0.0283,
0.0323, -0.0153,
0.0350, 0.0000,
$1*%
%ADD39IRREGPOLYD39, 0.0*%
G04  D40 : "Ellipse X72.0mil Y72.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0720*
%ADD40C, 0.0720*%
G04  D41 : "Ellipse X74.0mil Y84.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Irregular Polygon: DimX=0.0740, DimY=0.0840, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%AMIRREGPOLYD41*
4,1,16,
0.0370, 0.0000,
0.0342, 0.0161,
0.0262, 0.0297,
0.0142, 0.0388,
0.0000, 0.0420,
-0.0142, 0.0388,
-0.0262, 0.0297,
-0.0342, 0.0161,
-0.0370, 0.0000,
-0.0342, -0.0161,
-0.0262, -0.0297,
-0.0142, -0.0388,
0.0000, -0.0420,
0.0142, -0.0388,
0.0262, -0.0297,
0.0342, -0.0161,
0.0370, 0.0000,
$1*%
%ADD41IRREGPOLYD41, 0.0*%
G04  D42 : "Ellipse X76.0mil Y76.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0760*
%ADD42C, 0.0760*%
G04  D43 : "Mounting Hole X118.0mil Y118.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Mounting Hole: Diameter=0.1180, Rotation=0.0, LineWidth=0.0050 *
%ADD43MTHOLE, 0.1180 X0.0980 X0.0050 X0.0*%
G04  D44 : "Mounting Hole X158.0mil Y158.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Mounting Hole: Diameter=0.1580, Rotation=0.0, LineWidth=0.0050 *
%ADD44MTHOLE, 0.1580 X0.1380 X0.0050 X0.0*%
G04  D45 : "Oval X110.0mil Y70.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Obround: DimX=0.1100, DimY=0.0700, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD45O, 0.1100 X0.0700*%
G04  D46 : "Oval X114.0mil Y74.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Obround: DimX=0.1140, DimY=0.0740, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD46O, 0.1140 X0.0740*%
G04  D47 : "Oval X48.0mil Y50.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Obround: DimX=0.0480, DimY=0.0500, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD47O, 0.0480 X0.0500*%
G04  D48 : "Oval X52.0mil Y54.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Obround: DimX=0.0520, DimY=0.0540, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD48O, 0.0520 X0.0540*%
G04  D49 : "Oval X60.0mil Y78.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Obround: DimX=0.0600, DimY=0.0780, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD49O, 0.0600 X0.0780*%
G04  D50 : "Oval X60.0mil Y80.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Obround: DimX=0.0600, DimY=0.0800, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD50O, 0.0600 X0.0800*%
G04  D51 : "Oval X64.0mil Y48.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Obround: DimX=0.0640, DimY=0.0480, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD51O, 0.0640 X0.0480*%
G04  D52 : "Oval X64.0mil Y82.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Obround: DimX=0.0640, DimY=0.0820, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD52O, 0.0640 X0.0820*%
G04  D53 : "Oval X64.0mil Y84.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Obround: DimX=0.0640, DimY=0.0840, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD53O, 0.0640 X0.0840*%
G04  D54 : "Oval X68.0mil Y52.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Obround: DimX=0.0680, DimY=0.0520, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD54O, 0.0680 X0.0520*%
G04  D55 : "Ellipse X70.0mil Y70.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0700*
%ADD55C, 0.0700*%
G04  D56 : "Oval X70.0mil Y98.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Obround: DimX=0.0700, DimY=0.0980, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD56O, 0.0700 X0.0980*%
G04  D57 : "Oval X74.0mil Y102.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Obround: DimX=0.0740, DimY=0.1020, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD57O, 0.0740 X0.1020*%
G04  D58 : "Ellipse X74.0mil Y74.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0740*
%ADD58C, 0.0740*%
G04  D59 : "Ellipse X78.0mil Y78.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0780*
%ADD59C, 0.0780*%
G04  D60 : "Ellipse X80.0mil Y80.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0800*
%ADD60C, 0.0800*%
G04  D61 : "Ellipse X82.0mil Y82.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0820*
%ADD61C, 0.0820*%
G04  D62 : "Ellipse X84.0mil Y84.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0840*
%ADD62C, 0.0840*%
G04  D63 : "Rectangle X100.0mil Y60.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1000, DimY=0.0600, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD63R, 0.1000 X0.0600*%
G04  D64 : "Rectangle X100.0mil Y70.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1000, DimY=0.0700, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD64R, 0.1000 X0.0700*%
G04  D65 : "Rectangle X102.0mil Y160.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1020, DimY=0.1600, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD65R, 0.1020 X0.1600*%
G04  D66 : "Rectangle X102.0mil Y74.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1020, DimY=0.0740, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD66R, 0.1020 X0.0740*%
G04  D67 : "Rectangle X104.0mil Y64.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1040, DimY=0.0640, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD67R, 0.1040 X0.0640*%
G04  D68 : "Rectangle X104.0mil Y74.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1040, DimY=0.0740, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD68R, 0.1040 X0.0740*%
G04  D69 : "Rectangle X11.0mil Y92.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0110, DimY=0.0920, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD69R, 0.0110 X0.0920*%
G04  D70 : "Rectangle X110.0mil Y110.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Square: Side=0.1100, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000*
%ADD70R, 0.1100 X0.1100*%
G04  D71 : "Rectangle X110.0mil Y149.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1100, DimY=0.1490, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD71R, 0.1100 X0.1490*%
G04  D72 : "Rectangle X114.0mil Y114.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Square: Side=0.1140, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000*
%ADD72R, 0.1140 X0.1140*%
G04  D73 : "Rectangle X114.0mil Y153.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1140, DimY=0.1530, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD73R, 0.1140 X0.1530*%
G04  D74 : "Rectangle X114.0mil Y156.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1140, DimY=0.1560, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD74R, 0.1140 X0.1560*%
G04  D75 : "Rectangle X118.0mil Y160.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1180, DimY=0.1600, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD75R, 0.1180 X0.1600*%
G04  D76 : "Rectangle X124.0mil Y100.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1240, DimY=0.1000, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD76R, 0.1240 X0.1000*%
G04  D77 : "Rectangle X128.0mil Y104.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1280, DimY=0.1040, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD77R, 0.1280 X0.1040*%
G04  D78 : "Rectangle X14.0mil Y64.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0140, DimY=0.0640, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD78R, 0.0140 X0.0640*%
G04  D79 : "Rectangle X148.0mil Y110.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1480, DimY=0.1100, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD79R, 0.1480 X0.1100*%
G04  D80 : "Rectangle X149.0mil Y110.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1490, DimY=0.1100, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD80R, 0.1490 X0.1100*%
G04  D81 : "Rectangle X15.0mil Y96.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0150, DimY=0.0960, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD81R, 0.0150 X0.0960*%
G04  D82 : "Rectangle X152.0mil Y114.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1520, DimY=0.1140, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD82R, 0.1520 X0.1140*%
G04  D83 : "Rectangle X153.0mil Y114.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1530, DimY=0.1140, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD83R, 0.1530 X0.1140*%
G04  D84 : "Rectangle X156.0mil Y46.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1560, DimY=0.0460, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD84R, 0.1560 X0.0460*%
G04  D85 : "Rectangle X160.0mil Y50.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.1600, DimY=0.0500, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD85R, 0.1600 X0.0500*%
G04  D86 : "Rectangle X18.0mil Y68.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0180, DimY=0.0680, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD86R, 0.0180 X0.0680*%
G04  D87 : "Rectangle X20.0mil Y76.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0200, DimY=0.0760, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD87R, 0.0200 X0.0760*%
G04  D88 : "Rectangle X22.0mil Y78.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0220, DimY=0.0780, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD88R, 0.0220 X0.0780*%
G04  D89 : "Rectangle X22.0mil Y86.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0220, DimY=0.0860, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD89R, 0.0220 X0.0860*%
G04  D90 : "Rectangle X236.0mil Y118.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.2360, DimY=0.1180, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD90R, 0.2360 X0.1180*%
G04  D91 : "Rectangle X236.0mil Y314.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.2360, DimY=0.3140, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD91R, 0.2360 X0.3140*%
G04  D92 : "Rectangle X24.0mil Y80.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0240, DimY=0.0800, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD92R, 0.0240 X0.0800*%
G04  D93 : "Rectangle X240.0mil Y122.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.2400, DimY=0.1220, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD93R, 0.2400 X0.1220*%
G04  D94 : "Rectangle X240.0mil Y318.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.2400, DimY=0.3180, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD94R, 0.2400 X0.3180*%
G04  D95 : "Rectangle X26.0mil Y76.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0260, DimY=0.0760, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD95R, 0.0260 X0.0760*%
G04  D96 : "Rectangle X26.0mil Y80.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0260, DimY=0.0800, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD96R, 0.0260 X0.0800*%
G04  D97 : "Rectangle X26.0mil Y82.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0260, DimY=0.0820, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD97R, 0.0260 X0.0820*%
G04  D98 : "Rectangle X26.0mil Y90.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0260, DimY=0.0900, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD98R, 0.0260 X0.0900*%
G04  D99 : "Rectangle X27.0mil Y118.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0270, DimY=0.1180, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD99R, 0.0270 X0.1180*%
G04  D100 : "Rectangle X30.0mil Y80.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0300, DimY=0.0800, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD100R, 0.0300 X0.0800*%
G04  D101 : "Rectangle X30.0mil Y84.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0300, DimY=0.0840, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD101R, 0.0300 X0.0840*%
G04  D102 : "Rectangle X30.0mil Y86.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0300, DimY=0.0860, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD102R, 0.0300 X0.0860*%
G04  D103 : "Rectangle X31.0mil Y122.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0310, DimY=0.1220, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD103R, 0.0310 X0.1220*%
G04  D104 : "Rectangle X34.0mil Y90.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0340, DimY=0.0900, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD104R, 0.0340 X0.0900*%
G04  D105 : "Rectangle X40.0mil Y60.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0400, DimY=0.0600, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD105R, 0.0400 X0.0600*%
G04  D106 : "Rectangle X42.0mil Y54.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0420, DimY=0.0540, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD106R, 0.0420 X0.0540*%
G04  D107 : "Rectangle X44.0mil Y54.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0440, DimY=0.0540, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD107R, 0.0440 X0.0540*%
G04  D108 : "Rectangle X44.0mil Y64.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0440, DimY=0.0640, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD108R, 0.0440 X0.0640*%
G04  D109 : "Rectangle X46.0mil Y58.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0460, DimY=0.0580, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD109R, 0.0460 X0.0580*%
G04  D110 : "Rectangle X48.0mil Y58.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0480, DimY=0.0580, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD110R, 0.0480 X0.0580*%
G04  D111 : "Rectangle X50.0mil Y100.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0500, DimY=0.1000, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD111R, 0.0500 X0.1000*%
G04  D112 : "Rectangle X54.0mil Y104.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0540, DimY=0.1040, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD112R, 0.0540 X0.1040*%
G04  D113 : "Rectangle X54.0mil Y16.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0540, DimY=0.0160, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD113R, 0.0540 X0.0160*%
G04  D114 : "Rectangle X54.0mil Y42.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0540, DimY=0.0420, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD114R, 0.0540 X0.0420*%
G04  D115 : "Rectangle X54.0mil Y44.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0540, DimY=0.0440, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD115R, 0.0540 X0.0440*%
G04  D116 : "Rectangle X58.0mil Y20.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0580, DimY=0.0200, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD116R, 0.0580 X0.0200*%
G04  D117 : "Rectangle X58.0mil Y46.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0580, DimY=0.0460, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD117R, 0.0580 X0.0460*%
G04  D118 : "Rectangle X58.0mil Y48.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0580, DimY=0.0480, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD118R, 0.0580 X0.0480*%
G04  D119 : "Rectangle X58.0mil Y78.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0580, DimY=0.0780, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD119R, 0.0580 X0.0780*%
G04  D120 : "Rectangle X60.0mil Y40.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0600, DimY=0.0400, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD120R, 0.0600 X0.0400*%
G04  D121 : "Rectangle X60.0mil Y60.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Square: Side=0.0600, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000*
%ADD121R, 0.0600 X0.0600*%
G04  D122 : "Rectangle X60.0mil Y78.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0600, DimY=0.0780, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD122R, 0.0600 X0.0780*%
G04  D123 : "Rectangle X60.0mil Y80.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0600, DimY=0.0800, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD123R, 0.0600 X0.0800*%
G04  D124 : "Rectangle X62.0mil Y82.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0620, DimY=0.0820, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD124R, 0.0620 X0.0820*%
G04  D125 : "Rectangle X64.0mil Y32.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0640, DimY=0.0320, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD125R, 0.0640 X0.0320*%
G04  D126 : "Rectangle X64.0mil Y44.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0640, DimY=0.0440, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD126R, 0.0640 X0.0440*%
G04  D127 : "Rectangle X64.0mil Y64.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Square: Side=0.0640, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000*
%ADD127R, 0.0640 X0.0640*%
G04  D128 : "Rectangle X64.0mil Y82.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0640, DimY=0.0820, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD128R, 0.0640 X0.0820*%
G04  D129 : "Rectangle X64.0mil Y84.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0640, DimY=0.0840, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD129R, 0.0640 X0.0840*%
G04  D130 : "Rectangle X68.0mil Y36.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0680, DimY=0.0360, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD130R, 0.0680 X0.0360*%
G04  D131 : "Rectangle X70.0mil Y70.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Square: Side=0.0700, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000*
%ADD131R, 0.0700 X0.0700*%
G04  D132 : "Rectangle X74.0mil Y74.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Square: Side=0.0740, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000*
%ADD132R, 0.0740 X0.0740*%
G04  D133 : "Rectangle X74.0mil Y78.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0740, DimY=0.0780, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD133R, 0.0740 X0.0780*%
G04  D134 : "Rectangle X78.0mil Y110.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0780, DimY=0.1100, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD134R, 0.0780 X0.1100*%
G04  D135 : "Rectangle X78.0mil Y118.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0780, DimY=0.1180, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD135R, 0.0780 X0.1180*%
G04  D136 : "Rectangle X78.0mil Y58.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0780, DimY=0.0580, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD136R, 0.0780 X0.0580*%
G04  D137 : "Rectangle X78.0mil Y60.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0780, DimY=0.0600, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD137R, 0.0780 X0.0600*%
G04  D138 : "Rectangle X78.0mil Y78.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Square: Side=0.0780, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000*
%ADD138R, 0.0780 X0.0780*%
G04  D139 : "Rectangle X78.0mil Y82.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0780, DimY=0.0820, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD139R, 0.0780 X0.0820*%
G04  D140 : "Rectangle X80.0mil Y58.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0800, DimY=0.0580, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD140R, 0.0800 X0.0580*%
G04  D141 : "Rectangle X80.0mil Y80.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Square: Side=0.0800, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000*
%ADD141R, 0.0800 X0.0800*%
G04  D142 : "Rectangle X82.0mil Y114.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0820, DimY=0.1140, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD142R, 0.0820 X0.1140*%
G04  D143 : "Rectangle X82.0mil Y122.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0820, DimY=0.1220, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD143R, 0.0820 X0.1220*%
G04  D144 : "Rectangle X82.0mil Y62.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0820, DimY=0.0620, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD144R, 0.0820 X0.0620*%
G04  D145 : "Rectangle X82.0mil Y64.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0820, DimY=0.0640, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD145R, 0.0820 X0.0640*%
G04  D146 : "Rectangle X82.0mil Y82.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Square: Side=0.0820, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000*
%ADD146R, 0.0820 X0.0820*%
G04  D147 : "Rectangle X84.0mil Y62.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0840, DimY=0.0620, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD147R, 0.0840 X0.0620*%
G04  D148 : "Rectangle X84.0mil Y84.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Square: Side=0.0840, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000*
%ADD148R, 0.0840 X0.0840*%
G04  D149 : "Rectangle X84.0mil Y90.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0840, DimY=0.0900, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD149R, 0.0840 X0.0900*%
G04  D150 : "Rectangle X88.0mil Y94.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0880, DimY=0.0940, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD150R, 0.0880 X0.0940*%
G04  D151 : "Rectangle X90.0mil Y84.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0900, DimY=0.0840, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD151R, 0.0900 X0.0840*%
G04  D152 : "Rectangle X92.0mil Y11.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0920, DimY=0.0110, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD152R, 0.0920 X0.0110*%
G04  D153 : "Rectangle X94.0mil Y88.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0940, DimY=0.0880, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD153R, 0.0940 X0.0880*%
G04  D154 : "Rectangle X96.0mil Y15.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0960, DimY=0.0150, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD154R, 0.0960 X0.0150*%
G04  D155 : "Rectangle X98.0mil Y156.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0980, DimY=0.1560, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD155R, 0.0980 X0.1560*%
G04  D156 : "Rectangle X98.0mil Y70.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Rectangular: DimX=0.0980, DimY=0.0700, Rotation=0.0, OffsetX=0.0000, OffsetY=0.0000, HoleDia=0.0000 *
%ADD156R, 0.0980 X0.0700*%
G04  D157 : "Ellipse X28.0mil Y28.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0280*
%ADD157C, 0.0280*%
G04  D158 : "Ellipse X32.0mil Y32.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0320*
%ADD158C, 0.0320*%
G04  D159 : "Ellipse X36.0mil Y36.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0360*
%ADD159C, 0.0360*%
G04  D160 : "Ellipse X40.0mil Y40.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0400*
%ADD160C, 0.0400*%
G04  D161 : "Ellipse X44.0mil Y44.0mil H0.0mil 0.0deg (0.0mil,0.0mil) Flash"*
G04  Disc: OuterDia=0.0440*
%ADD161C, 0.0440*%
G04*
%FSLAX44Y44*%
%SFA1B1*%
%OFA0.0000B0.0000*%
G04*
G70*
G90*
G01*
D2*
%LNBoard*%
D27*
X130000Y62750*
Y108000D1*
X45000Y62750D2*
Y108000D1*
Y62750D2*
X130000D1*
X45000Y108000D2*
X130000D1*
Y62750D2*
Y108000D1*
X45000*
Y62750*
X130000*
X45000Y93100D2*
Y96100D1*
%LNTop Paste*%
X45000Y96100D2*
D105*
X46710Y75950D3*
X47500D3*
X50040Y73500D3*
X49250D3*
X49200Y97050D3*
X49990D3*
X52400Y75550D3*
X51610D3*
D106*
X52380Y85820D3*
X52750Y84800D3*
X52000D3*
D120*
X53050Y97640D3*
Y96850D3*
X56000Y79900D3*
Y79110D3*
X54750Y85100D3*
Y85890D3*
D105*
X61400Y74000D3*
X60610D3*
Y76000D3*
X61400D3*
D107*
X66780Y93780D3*
X66410Y94800D3*
X67150D3*
D105*
X73610Y97000D3*
X74400D3*
X76390D3*
X75600D3*
D115*
X86520Y73620D3*
X85500Y73250D3*
Y74000D3*
X89020Y73630D3*
X88000Y73260D3*
Y74000D3*
D120*
X88100Y85310D3*
Y86100D3*
D115*
X88200Y95000D3*
Y94260D3*
X89220Y94630D3*
X90500Y74000D3*
Y73250D3*
X91520Y73620D3*
D105*
X91650Y78500D3*
X90860D3*
D120*
X91500Y82650D3*
Y83440D3*
D137*
X92050Y101130D3*
Y99550D3*
D120*
X94050Y76450D3*
Y75660D3*
D114*
X94500Y95000D3*
Y94250D3*
X95520Y94620D3*
D137*
X93750Y99500D3*
Y101080D3*
D114*
X97720Y94620D3*
X96700Y94250D3*
Y95000D3*
D120*
X100350Y69360D3*
Y70150D3*
D105*
X101150Y79350D3*
X100360D3*
D120*
X102500Y100400D3*
Y99610D3*
D105*
X109060Y92400D3*
X109850D3*
X115690Y97850D3*
X114900D3*
D120*
X123500Y74390D3*
Y73610D3*
X125050Y76800D3*
Y76010D3*
X125100Y79060D3*
Y79850D3*
Y82800D3*
Y82010D3*
Y85790D3*
Y85000D3*
X123500Y92390D3*
Y91610D3*
X124400Y99650D3*
Y100440D3*
D105*
X47490Y74700D3*
X46700D3*
D120*
X46500Y77200D3*
Y77990D3*
X49500Y67840D3*
Y67050D3*
D105*
X49210Y74500D3*
X50000D3*
X49990Y75500D3*
X49210D3*
X51610Y74500D3*
X52400D3*
D120*
X51550Y95700D3*
Y94910D3*
D106*
X52380Y89870D3*
X52750Y88850D3*
X52000D3*
X52380Y87820D3*
X52750Y86800D3*
X52000D3*
D120*
X52550Y93990D3*
Y93200D3*
X55950Y81600D3*
Y80810D3*
X54550Y77400D3*
Y76610D3*
D137*
X55750Y101130D3*
Y99880D3*
D120*
X58950Y77110D3*
Y77900D3*
X58000Y77890D3*
Y77100D3*
D95*
X59500Y76000D3*
X59000D3*
X58500D3*
X58000D3*
X59500Y74000D3*
X59000D3*
X58500D3*
X58000D3*
D137*
X58250Y99870D3*
Y101130D3*
Y104380D3*
Y103120D3*
D105*
X61400Y75000D3*
X60610D3*
X63650Y95500D3*
X64440D3*
D120*
X68000Y95600D3*
Y96390D3*
Y87900D3*
Y87110D3*
D137*
X67100Y104580D3*
Y103000D3*
D120*
X70050Y71150D3*
Y71940D3*
D105*
X70350Y81500D3*
X71140D3*
D120*
X70000Y87100D3*
Y87890D3*
X71000D3*
Y87100D3*
D105*
X74400Y96000D3*
X73610D3*
X75610Y95950D3*
X76400D3*
D120*
X79250Y69900D3*
Y69110D3*
Y71350D3*
Y72140D3*
X81750Y69900D3*
Y69110D3*
D137*
X83000Y69750D3*
Y68180D3*
D120*
Y71350D3*
Y72140D3*
X81650Y82690D3*
Y81910D3*
D137*
X85500Y68180D3*
Y69750D3*
X88000Y68180D3*
Y69750D3*
D120*
X89250Y69890D3*
Y69100D3*
X88000Y72140D3*
Y71350D3*
X89250D3*
Y72140D3*
X88500Y83390D3*
Y82600D3*
X88100Y90390D3*
Y89600D3*
X90550Y66250D3*
Y67040D3*
X91750Y69100D3*
Y69890D3*
Y71360D3*
Y72150D3*
X90500Y82610D3*
Y83400D3*
D115*
X94000Y72050D3*
Y71310D3*
X95020Y71680D3*
D120*
X94800Y69400D3*
Y70190D3*
X97250Y71890D3*
Y71100D3*
X102500Y101360D3*
Y102150D3*
X106950Y90600D3*
Y91390D3*
X109400Y70690D3*
Y69900D3*
D136*
X113200Y70320D3*
D137*
Y69070D3*
D120*
X115700Y101060D3*
Y101850D3*
D106*
X115300Y98850D3*
X116040D3*
X115670Y99880D3*
D136*
X119300Y69370D3*
Y70630D3*
D120*
X119000Y100610D3*
Y101400D3*
D136*
X120750Y70630D3*
Y69370D3*
D120*
X121750Y99610D3*
Y100400D3*
X71000Y73890D3*
Y73110D3*
X74000Y73900D3*
Y73110D3*
X73000D3*
Y73890D3*
X81750Y71350D3*
Y72140D3*
X84500Y97850D3*
Y98640D3*
X85500Y71350D3*
Y72140D3*
X89000Y97050D3*
Y97840D3*
X91500Y97890D3*
Y97100D3*
X94500Y97150D3*
Y97940D3*
X93500Y97890D3*
Y97100D3*
X96500Y97900D3*
Y97110D3*
X97500Y97100D3*
Y97890D3*
X115250Y71900D3*
Y71110D3*
D105*
X47110Y73500D3*
X47900D3*
D120*
X48950Y77300D3*
Y76510D3*
D122*
X46970Y85650D3*
X48220D3*
D105*
X48340Y97050D3*
X47550D3*
X48300Y100000D3*
X49090D3*
D120*
X53050Y67060D3*
Y67850D3*
D105*
X53400Y73500D3*
X54190D3*
X51610D3*
X52400D3*
X56900Y74000D3*
X56110D3*
Y76000D3*
X56900D3*
D120*
X56000Y85900D3*
Y85110D3*
X53500Y85100D3*
Y85890D3*
D134*
X57380Y88250D3*
X55010D3*
D106*
X52370Y92320D3*
X52740Y91300D3*
X52000D3*
D120*
X59800Y94300D3*
Y93510D3*
D105*
X50800Y97050D3*
X51590D3*
D120*
X54250Y97640D3*
Y96850D3*
D105*
X67110Y69550D3*
X67900D3*
X66150D3*
X65360D3*
X64390D3*
X63610D3*
D120*
X70000Y73890D3*
Y73100D3*
X63000Y72750D3*
Y73540D3*
D105*
X66940Y80400D3*
X66160D3*
X70350Y82500D3*
X71140D3*
D138*
X67560Y85750D3*
X66000D3*
D105*
X64010Y87550D3*
X64790D3*
D122*
X65270Y94000D3*
X63700D3*
D105*
X71900Y97000D3*
X71110D3*
X69100D3*
X69890D3*
D115*
X78000Y74000D3*
Y73250D3*
X79020Y73620D3*
X81520Y73630D3*
X80500Y73260D3*
Y74000D3*
X84020Y73620D3*
X83000Y73250D3*
Y74000D3*
D120*
X75300Y76760D3*
Y77540D3*
Y78660D3*
Y79450D3*
X78250Y78550D3*
Y79340D3*
D105*
X75950Y91700D3*
X76740D3*
D107*
X76370Y95020D3*
X76740Y94000D3*
X76000D3*
X96230Y68420D3*
X96600Y67400D3*
X95850D3*
D120*
X95750Y70190D3*
Y69400D3*
D115*
X97120Y73370D3*
X96100Y73000D3*
Y73750D3*
D120*
X93000Y73890D3*
Y73100D3*
X92950Y76490D3*
Y75700D3*
D105*
X91650Y77250D3*
X90860D3*
X92860Y79250D3*
X93650D3*
D115*
X90400Y95000D3*
Y94250D3*
X91420Y94620D3*
X92500Y95000D3*
Y94260D3*
X93520Y94630D3*
D120*
X90250Y97890D3*
Y97100D3*
X101500Y69400D3*
Y70190D3*
D105*
X98550Y71050D3*
X99340D3*
X98760Y79350D3*
X99540D3*
D149*
X100670Y85850D3*
X102320D3*
D105*
X107540Y85500D3*
X106750D3*
X99400D3*
X98610D3*
D114*
X102450Y88350D3*
Y87610D3*
X103470Y87980D3*
D115*
X105670D3*
X104650Y87610D3*
Y88350D3*
D105*
X106610Y88050D3*
X107400D3*
D120*
X105700Y91390D3*
Y90600D3*
D105*
X102350Y92100D3*
X101560D3*
D120*
X108000Y97850D3*
Y97060D3*
D119*
X117970Y88100D3*
X119220D3*
D105*
X116560Y97850D3*
X117350D3*
D120*
X123500Y79610D3*
Y80390D3*
Y86390D3*
Y85610D3*
X125100Y88890D3*
Y88100D3*
D149*
X126820Y91500D3*
X125170D3*
D120*
X122950Y100400D3*
Y99610D3*
D105*
X49100Y84150D3*
X48310D3*
D121*
X45570Y94200D3*
Y95000D3*
D113*
X46630Y94090D3*
Y94600D3*
Y94860D3*
Y95110D3*
Y94340D3*
D105*
X49100Y99000D3*
X48310D3*
D76*
X52050Y69080D3*
Y72320D3*
D105*
X52740Y84000D3*
X51950D3*
X50510Y77400D3*
X51300D3*
D120*
X53500D3*
Y76610D3*
X57000Y79900D3*
Y79110D3*
D105*
X56110Y75000D3*
X56900D3*
D120*
X57000Y77900D3*
Y77110D3*
D138*
X60100Y90260D3*
Y88700D3*
D105*
X56140Y86800D3*
X55350D3*
D64*
X57450Y89730D3*
Y91470D3*
D63*
Y90600D3*
D120*
X53500Y89100D3*
Y89890D3*
Y87690D3*
Y86900D3*
D102*
X55250Y92990D3*
Y95190D3*
X55750D3*
X56250D3*
X56750D3*
X57250D3*
X57750D3*
X58250D3*
X58750Y92990D3*
X58250D3*
X57750D3*
X57250D3*
X56750D3*
X56250D3*
X55750D3*
X58750Y95190D3*
D120*
X51600Y93210D3*
Y94000D3*
X59750Y92740D3*
Y91950D3*
D137*
X57000Y101130D3*
Y99870D3*
X59500D3*
Y101130D3*
Y103120D3*
Y104370D3*
X57000Y103120D3*
Y104380D3*
D120*
X63000Y71000D3*
Y71790D3*
X72250Y83500D3*
Y84290D3*
D134*
X70830Y84550D3*
X68460D3*
D90*
X71780Y79000D3*
X68230D3*
D120*
X72100Y87850D3*
Y87060D3*
X66000Y87100D3*
Y87890D3*
X69000Y87110D3*
Y87890D3*
D105*
X71100Y96000D3*
X71890D3*
X69900D3*
X69110D3*
D120*
X66800Y95610D3*
Y96400D3*
X65500D3*
Y95610D3*
D105*
X69340Y92750D3*
X68550D3*
X65190D3*
X64400D3*
D71*
X67900Y101000D3*
X65110D3*
D137*
X78000Y68180D3*
Y69750D3*
X80500D3*
Y68180D3*
D120*
X84250Y69900D3*
Y69110D3*
X78000Y72140D3*
Y71350D3*
X80500Y71360D3*
Y72150D3*
X84250Y72140D3*
Y71350D3*
X81250Y80790D3*
Y80010D3*
X75150Y88060D3*
Y88850D3*
D105*
X76750Y92750D3*
X75960D3*
X74110D3*
X74900D3*
D120*
X81450Y87040D3*
Y86250D3*
X78450Y89050D3*
Y88260D3*
X96250Y71100D3*
Y71890D3*
D137*
X90500Y68180D3*
Y69750D3*
D120*
X86750Y69100D3*
Y69890D3*
X90500Y71350D3*
Y72140D3*
X86750D3*
Y71350D3*
X93000D3*
Y72140D3*
D105*
X96640Y65500D3*
X95850D3*
X95860Y66500D3*
X96650D3*
D115*
X93800Y69300D3*
Y70050D3*
X92780Y69680D3*
D120*
X89500Y82600D3*
Y83390D3*
D115*
X92900Y78150D3*
Y77410D3*
X93920Y77780D3*
D107*
X91280Y75180D3*
X90910Y76200D3*
X91650D3*
D105*
X96890Y75150D3*
X96100D3*
D120*
X96000Y99110D3*
Y99900D3*
D122*
X105330Y69350D3*
X106580D3*
D135*
X102700Y65700D3*
D91*
X103600Y68530D3*
D135*
X104510Y65700D3*
D107*
X98920Y69080D3*
X98550Y70100D3*
X99300D3*
D155*
X103250Y83050D3*
X100500D3*
D115*
X108000Y91400D3*
Y90660D3*
X109020Y91030D3*
D120*
X108000Y95900D3*
Y95110D3*
D114*
X102450Y93100D3*
Y93850D3*
X101430Y93480D3*
D120*
X101750Y96000D3*
Y95210D3*
X107050Y101640D3*
Y100860D3*
D137*
X105550Y101630D3*
Y100380D3*
D136*
X116350Y69950D3*
Y68380D3*
D120*
X116500Y71900D3*
Y71110D3*
D105*
X114950Y80000D3*
X114160D3*
D80*
X111300Y78140D3*
Y75350D3*
D84*
X113540Y78830D3*
Y78160D3*
Y77500D3*
Y76830D3*
Y76160D3*
D151*
X119350Y89320D3*
Y90970D3*
D120*
X117350Y101850D3*
Y101060D3*
D106*
X116950Y98850D3*
X117700D3*
X117330Y99880D3*
D120*
X120350Y100610D3*
Y101400D3*
D122*
X126370Y84000D3*
X125120D3*
Y81000D3*
X126370D3*
Y75000D3*
X125120D3*
Y78000D3*
X126370D3*
Y87000D3*
X125120D3*
D120*
X125750Y101650D3*
Y100860D3*
D114*
X121970Y98370D3*
X123000Y98740D3*
Y98000D3*
D105*
X50300Y84450D3*
X51090D3*
D102*
X56250Y96310D3*
X59250Y98510D3*
X58750D3*
X58250D3*
X57750D3*
X57250D3*
X56750D3*
X56250D3*
X56750Y96310D3*
X57250D3*
X57750D3*
X58250D3*
X58750D3*
X59250D3*
X59750D3*
Y98510D3*
D120*
X72000Y73890D3*
Y73100D3*
D71*
X65110Y98250D3*
X67900D3*
D89*
X67750Y73250D3*
Y71050D3*
X67250D3*
X66750D3*
X66250D3*
X65750D3*
X65250D3*
X64750D3*
X64250Y73250D3*
X64750D3*
X65250D3*
X65750D3*
X66250D3*
X66750D3*
X67250D3*
X64250Y71050D3*
D152*
X74250Y86050D3*
Y84270D3*
D69*
X74830Y86630D3*
D152*
X74250Y84080D3*
Y83880D3*
Y83680D3*
Y83490D3*
Y83290D3*
Y83090D3*
Y82900D3*
Y82700D3*
Y82500D3*
Y85850D3*
Y82300D3*
Y82110D3*
Y81910D3*
Y81710D3*
Y81520D3*
Y81320D3*
D69*
X74830Y80740D3*
X75020D3*
X75220D3*
X75420D3*
D152*
X74250Y85650D3*
D69*
X75610Y80740D3*
X75810D3*
X76010D3*
X76200D3*
X76400D3*
X76600D3*
X76790D3*
X76990D3*
X77190D3*
X77380D3*
D152*
X74250Y85450D3*
D69*
X77580Y80740D3*
X77780D3*
X77980D3*
X78170D3*
X78370D3*
X78570D3*
X78760D3*
X78960D3*
X79160D3*
X79350D3*
D152*
X74250Y85260D3*
D69*
X79550Y80740D3*
D152*
X80130Y81320D3*
Y81520D3*
Y81710D3*
Y81910D3*
Y82110D3*
Y82300D3*
Y82500D3*
Y82700D3*
Y82900D3*
X74250Y85060D3*
X80130Y83090D3*
Y83290D3*
Y83490D3*
Y83680D3*
Y83880D3*
Y84080D3*
Y84270D3*
Y84470D3*
Y84670D3*
Y84860D3*
X74250D3*
X80130Y85060D3*
Y85260D3*
Y85450D3*
Y85650D3*
Y85850D3*
Y86050D3*
D69*
X79550Y86630D3*
X79350D3*
X79160D3*
X78960D3*
D152*
X74250Y84670D3*
D69*
X78760Y86630D3*
X78570D3*
X78370D3*
X78170D3*
X77980D3*
X77780D3*
X77580D3*
X77380D3*
X77190D3*
X76990D3*
D152*
X74250Y84470D3*
D69*
X76790Y86630D3*
X76600D3*
X76400D3*
X76200D3*
X76010D3*
X75810D3*
X75610D3*
X75420D3*
X75220D3*
X75020D3*
D99*
X83000Y96500D3*
X82500D3*
X82000D3*
X81500D3*
X81000D3*
X80500D3*
X80000D3*
X79000Y100000D3*
X79500Y96500D3*
Y100000D3*
X80000D3*
X80500D3*
X81000D3*
X81500D3*
X82000D3*
X82500D3*
X83000D3*
X83500D3*
Y96500D3*
X79000D3*
D120*
X95500Y97110D3*
Y97900D3*
X92500Y97100D3*
Y97890D3*
D135*
X106500Y98000D3*
D91*
X105600Y95170D3*
D135*
X104690Y98000D3*
D111*
X101150Y78000D3*
X100150D3*
X99150D3*
D79*
X118950Y86600D3*
Y83810D3*
D120*
X114000Y71900D3*
Y71110D3*
D151*
X119650Y99680D3*
Y98030D3*
D107*
X74150Y94000D3*
X74890D3*
X74520Y95020D3*
D105*
X122100Y97000D3*
X122890D3*
D76*
X47500Y69130D3*
Y72370D3*
D96*
X48750Y83000D3*
X48250D3*
X47250D3*
X47750D3*
X51750D3*
X51250D3*
X50750D3*
X50250D3*
X49750D3*
X49250D3*
X49750Y79000D3*
X49250D3*
X48750D3*
X48250D3*
X47750D3*
X47250D3*
X52750Y83000D3*
X52250D3*
X50750Y79000D3*
X50250D3*
X54750Y83000D3*
X54250D3*
X53750D3*
X53250D3*
X52750Y79000D3*
X52250D3*
X51750D3*
X51250D3*
X53250D3*
X53750D3*
X54250D3*
X54750D3*
D78*
X50520Y93050D3*
X50770D3*
Y95810D3*
X50520D3*
X47450D3*
X47710D3*
X47960D3*
X48220D3*
X48470D3*
X48730D3*
X48990D3*
X49240D3*
X49500D3*
X49750D3*
X50010D3*
X50260D3*
Y93050D3*
X50010D3*
X49750D3*
X49500D3*
X49240D3*
X48990D3*
X48730D3*
X48470D3*
X48220D3*
X47960D3*
X47710D3*
X47450D3*
D125*
X47800Y91260D3*
Y89960D3*
Y88660D3*
Y90830D3*
Y90390D3*
Y89100D3*
Y88230D3*
Y89530D3*
D140*
X50050Y86790D3*
X46780D3*
X50050Y92200D3*
X46780D3*
D137*
X50500Y100270D3*
Y101520D3*
D87*
X74000Y69650D3*
X74500D3*
X74000Y71650D3*
X74500D3*
X73000Y69650D3*
X73500D3*
X73000Y71650D3*
X73500D3*
X71000Y69650D3*
X71500D3*
X72000D3*
X72500D3*
X71000Y71650D3*
X71500D3*
X72000D3*
X72500D3*
D105*
X72900Y80500D3*
X72110D3*
D88*
X85500Y88500D3*
X86000D3*
X86500D3*
X87000D3*
Y91500D3*
X86500D3*
X86000D3*
X85500D3*
D120*
X73200Y93900D3*
Y93110D3*
D137*
X98850Y101820D3*
Y100570D3*
D71*
X61110Y101000D3*
X63900D3*
D114*
X109050Y93300D3*
Y94050D3*
X108030Y93680D3*
D156*
X123280Y101500D3*
X121710D3*
D96*
X85500Y84550D3*
X86000D3*
X86500D3*
X87000D3*
X85500Y86750D3*
X86000D3*
X86500D3*
X87000D3*
D71*
X61110Y98250D3*
X63900D3*
D74*
X109480Y73300D3*
X103410D3*
D02M02*
