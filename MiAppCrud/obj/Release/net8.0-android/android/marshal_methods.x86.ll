; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [120 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [240 x i32] [
	i32 42639949, ; 0: System.Threading.Thread => 0x28aa24d => 110
	i32 67008169, ; 1: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 2: Microsoft.Maui.Graphics.dll => 0x44bb714 => 47
	i32 117431740, ; 3: System.Runtime.InteropServices => 0x6ffddbc => 103
	i32 182336117, ; 4: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 76
	i32 195452805, ; 5: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 6: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 7: System.ComponentModel => 0xc38ff48 => 88
	i32 280992041, ; 8: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 9: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 10: Xamarin.AndroidX.Activity.dll => 0x13031348 => 54
	i32 336156722, ; 11: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 347068432, ; 12: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 51
	i32 356389973, ; 13: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 14: System.Threading.Thread.dll => 0x16a510e1 => 110
	i32 385762202, ; 15: System.Memory.dll => 0x16fe439a => 94
	i32 395744057, ; 16: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 17: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 18: System.Collections => 0x1a61054f => 85
	i32 450948140, ; 19: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 64
	i32 469710990, ; 20: System.dll => 0x1bff388e => 113
	i32 498788369, ; 21: System.ObjectModel => 0x1dbae811 => 99
	i32 500358224, ; 22: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 23: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 24: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 42
	i32 539058512, ; 25: Microsoft.Extensions.Logging => 0x20216150 => 39
	i32 592146354, ; 26: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 27: Xamarin.AndroidX.CustomView => 0x2568904f => 62
	i32 627931235, ; 28: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 29: System.Text.Encodings.Web.dll => 0x27787397 => 107
	i32 672442732, ; 30: System.Collections.Concurrent => 0x2814a96c => 83
	i32 688181140, ; 31: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 32: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 33: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 34: System.Runtime.Loader.dll => 0x2b15ed29 => 104
	i32 748832960, ; 35: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 49
	i32 759454413, ; 36: System.Net.Requests => 0x2d445acd => 97
	i32 775507847, ; 37: System.IO.Compression => 0x2e394f87 => 91
	i32 777317022, ; 38: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 39: Microsoft.Extensions.Options => 0x2f0980eb => 41
	i32 823281589, ; 40: System.Private.Uri.dll => 0x311247b5 => 100
	i32 830298997, ; 41: System.IO.Compression.Brotli => 0x317d5b75 => 90
	i32 904024072, ; 42: System.ComponentModel.Primitives.dll => 0x35e25008 => 86
	i32 926902833, ; 43: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 992768348, ; 44: System.Collections.dll => 0x3b2c715c => 85
	i32 1012816738, ; 45: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 75
	i32 1028951442, ; 46: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 38
	i32 1029334545, ; 47: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 48: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 55
	i32 1044663988, ; 49: System.Linq.Expressions.dll => 0x3e444eb4 => 92
	i32 1082857460, ; 50: System.ComponentModel.TypeConverter => 0x408b17f4 => 87
	i32 1084122840, ; 51: Xamarin.Kotlin.StdLib => 0x409e66d8 => 80
	i32 1098259244, ; 52: System => 0x41761b2c => 113
	i32 1118262833, ; 53: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 54: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 55: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 72
	i32 1203215381, ; 56: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 57: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1246548578, ; 58: Xamarin.AndroidX.Collection.Jvm.dll => 0x4a4cd262 => 58
	i32 1260983243, ; 59: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1292207520, ; 60: SQLitePCLRaw.core.dll => 0x4d0585a0 => 50
	i32 1293217323, ; 61: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 63
	i32 1324164729, ; 62: System.Linq => 0x4eed2679 => 93
	i32 1373134921, ; 63: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 64: Xamarin.AndroidX.SavedState => 0x52114ed3 => 75
	i32 1406073936, ; 65: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 59
	i32 1430672901, ; 66: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1437299793, ; 67: Xamarin.AndroidX.Lifecycle.Common.Jvm => 0x55ab7451 => 65
	i32 1441095154, ; 68: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 0x55e55df2 => 67
	i32 1461004990, ; 69: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 70: System.IO.Compression.dll => 0x57261233 => 91
	i32 1469204771, ; 71: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 56
	i32 1470490898, ; 72: Microsoft.Extensions.Primitives => 0x57a5e912 => 42
	i32 1480492111, ; 73: System.IO.Compression.Brotli.dll => 0x583e844f => 90
	i32 1493001747, ; 74: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 75: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 76: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 109
	i32 1551623176, ; 77: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 78: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 69
	i32 1624863272, ; 79: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 78
	i32 1636350590, ; 80: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 61
	i32 1639515021, ; 81: System.Net.Http.dll => 0x61b9038d => 95
	i32 1639986890, ; 82: System.Text.RegularExpressions => 0x61c036ca => 109
	i32 1657153582, ; 83: System.Runtime => 0x62c6282e => 105
	i32 1658251792, ; 84: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 79
	i32 1677501392, ; 85: System.Net.Primitives.dll => 0x63fca3d0 => 96
	i32 1679769178, ; 86: System.Security.Cryptography => 0x641f3e5a => 106
	i32 1711441057, ; 87: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 51
	i32 1729485958, ; 88: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 57
	i32 1736233607, ; 89: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 90: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1746316138, ; 91: Mono.Android.Export => 0x6816ab6a => 117
	i32 1766324549, ; 92: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 76
	i32 1770582343, ; 93: Microsoft.Extensions.Logging.dll => 0x6988f147 => 39
	i32 1780572499, ; 94: Mono.Android.Runtime.dll => 0x6a216153 => 118
	i32 1782862114, ; 95: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 96: Xamarin.AndroidX.Fragment => 0x6a96652d => 64
	i32 1793755602, ; 97: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 98: Xamarin.AndroidX.Loader => 0x6bcd3296 => 69
	i32 1813058853, ; 99: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 80
	i32 1813201214, ; 100: Xamarin.Google.Android.Material => 0x6c13413e => 79
	i32 1818569960, ; 101: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 73
	i32 1828688058, ; 102: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 40
	i32 1842015223, ; 103: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 104: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 105: System.Linq.Expressions => 0x6ec71a65 => 92
	i32 1875935024, ; 106: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 107: System.Collections.NonGeneric.dll => 0x71dc7c8b => 84
	i32 1968388702, ; 108: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 35
	i32 2003115576, ; 109: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2025202353, ; 110: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 111: System.Private.Xml => 0x79eb68ee => 101
	i32 2055257422, ; 112: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 66
	i32 2066184531, ; 113: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2079903147, ; 114: System.Runtime.dll => 0x7bf8cdab => 105
	i32 2090596640, ; 115: System.Numerics.Vectors => 0x7c9bf920 => 98
	i32 2103459038, ; 116: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 52
	i32 2105232135, ; 117: MiAppCrud.dll => 0x7d7b4b07 => 82
	i32 2127167465, ; 118: System.Console => 0x7ec9ffe9 => 89
	i32 2159891885, ; 119: Microsoft.Maui => 0x80bd55ad => 45
	i32 2169148018, ; 120: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 121: Microsoft.Extensions.Options.dll => 0x820d22b3 => 41
	i32 2192057212, ; 122: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 40
	i32 2193016926, ; 123: System.ObjectModel.dll => 0x82b6c85e => 99
	i32 2201107256, ; 124: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 81
	i32 2201231467, ; 125: System.Net.Http => 0x8334206b => 95
	i32 2207618523, ; 126: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2233323705, ; 127: MiAppCrud => 0x851dd0b9 => 82
	i32 2266799131, ; 128: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 36
	i32 2270573516, ; 129: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 130: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 74
	i32 2303942373, ; 131: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 132: System.Private.CoreLib.dll => 0x896b7878 => 115
	i32 2340441535, ; 133: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 102
	i32 2353062107, ; 134: System.Net.Primitives => 0x8c40e0db => 96
	i32 2368005991, ; 135: System.Xml.ReaderWriter.dll => 0x8d24e767 => 112
	i32 2371007202, ; 136: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 35
	i32 2395872292, ; 137: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 138: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 139: System.Console.dll => 0x912896e5 => 89
	i32 2465273461, ; 140: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 49
	i32 2471841756, ; 141: netstandard.dll => 0x93554fdc => 114
	i32 2475788418, ; 142: Java.Interop.dll => 0x93918882 => 116
	i32 2480646305, ; 143: Microsoft.Maui.Controls => 0x93dba8a1 => 43
	i32 2550873716, ; 144: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 145: System.Text.Encodings.Web => 0x9930ee42 => 107
	i32 2593496499, ; 146: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 147: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 81
	i32 2617129537, ; 148: System.Private.Xml.dll => 0x9bfe3a41 => 101
	i32 2620871830, ; 149: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 61
	i32 2626831493, ; 150: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 151: System.Runtime.Loader => 0x9ec4cf01 => 104
	i32 2732626843, ; 152: Xamarin.AndroidX.Activity => 0xa2e0939b => 54
	i32 2737747696, ; 153: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 56
	i32 2752995522, ; 154: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 155: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 44
	i32 2764765095, ; 156: Microsoft.Maui.dll => 0xa4caf7a7 => 45
	i32 2766642685, ; 157: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 0xa4e79dfd => 67
	i32 2778768386, ; 158: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 77
	i32 2780199943, ; 159: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 0xa5b67c07 => 65
	i32 2785988530, ; 160: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 161: Microsoft.Maui.Graphics => 0xa7008e0b => 47
	i32 2806116107, ; 162: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 163: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 59
	i32 2831556043, ; 164: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 165: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 77
	i32 2861098320, ; 166: Mono.Android.Export.dll => 0xaa88e550 => 117
	i32 2861189240, ; 167: Microsoft.Maui.Essentials => 0xaa8a4878 => 46
	i32 2909740682, ; 168: System.Private.CoreLib => 0xad6f1e8a => 115
	i32 2916838712, ; 169: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 78
	i32 2919462931, ; 170: System.Numerics.Vectors.dll => 0xae037813 => 98
	i32 2959614098, ; 171: System.ComponentModel.dll => 0xb0682092 => 88
	i32 2978675010, ; 172: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 63
	i32 3038032645, ; 173: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 174: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 70
	i32 3059408633, ; 175: Mono.Android.Runtime => 0xb65adef9 => 118
	i32 3059793426, ; 176: System.ComponentModel.Primitives => 0xb660be12 => 86
	i32 3077302341, ; 177: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3178803400, ; 178: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 71
	i32 3220365878, ; 179: System.Threading => 0xbff2e236 => 111
	i32 3258312781, ; 180: Xamarin.AndroidX.CardView => 0xc235e84d => 57
	i32 3286872994, ; 181: SQLite-net.dll => 0xc3e9b3a2 => 48
	i32 3305363605, ; 182: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 183: System.Net.Requests.dll => 0xc5b097e4 => 97
	i32 3317135071, ; 184: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 62
	i32 3346324047, ; 185: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 72
	i32 3357674450, ; 186: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 187: System.Text.Json => 0xc82afec1 => 108
	i32 3360279109, ; 188: SQLitePCLRaw.core => 0xc849ca45 => 50
	i32 3362522851, ; 189: Xamarin.AndroidX.Core => 0xc86c06e3 => 60
	i32 3366347497, ; 190: Java.Interop => 0xc8a662e9 => 116
	i32 3374999561, ; 191: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 74
	i32 3381016424, ; 192: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 193: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 37
	i32 3430777524, ; 194: netstandard => 0xcc7d82b4 => 114
	i32 3463511458, ; 195: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 196: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 87
	i32 3476120550, ; 197: Mono.Android => 0xcf3163e6 => 119
	i32 3479583265, ; 198: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 199: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 200: System.Text.Json.dll => 0xcfbaacae => 108
	i32 3580758918, ; 201: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 202: System.Linq.dll => 0xd715a361 => 93
	i32 3624195450, ; 203: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 102
	i32 3641597786, ; 204: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 66
	i32 3643446276, ; 205: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 206: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 71
	i32 3657292374, ; 207: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 36
	i32 3672681054, ; 208: Mono.Android.dll => 0xdae8aa5e => 119
	i32 3697841164, ; 209: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 210: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 70
	i32 3748608112, ; 211: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 53
	i32 3754567612, ; 212: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 52
	i32 3792276235, ; 213: System.Collections.NonGeneric => 0xe2098b0b => 84
	i32 3823082795, ; 214: System.Security.Cryptography.dll => 0xe3df9d2b => 106
	i32 3841636137, ; 215: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 38
	i32 3849253459, ; 216: System.Runtime.InteropServices.dll => 0xe56ef253 => 103
	i32 3876362041, ; 217: SQLite-net => 0xe70c9739 => 48
	i32 3889960447, ; 218: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 219: System.Collections.Concurrent.dll => 0xe839deed => 83
	i32 3896760992, ; 220: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 60
	i32 3910130544, ; 221: Xamarin.AndroidX.Collection.Jvm => 0xe90fdb70 => 58
	i32 3928044579, ; 222: System.Xml.ReaderWriter => 0xea213423 => 112
	i32 3931092270, ; 223: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 73
	i32 3955647286, ; 224: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 55
	i32 3980434154, ; 225: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 226: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 227: System.Memory => 0xeff49a63 => 94
	i32 4046471985, ; 228: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 44
	i32 4073602200, ; 229: System.Threading.dll => 0xf2ce3c98 => 111
	i32 4094352644, ; 230: Microsoft.Maui.Essentials.dll => 0xf40add04 => 46
	i32 4100113165, ; 231: System.Private.Uri => 0xf462c30d => 100
	i32 4102112229, ; 232: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 233: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 234: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 37
	i32 4150914736, ; 235: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 236: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 68
	i32 4213026141, ; 237: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 53
	i32 4271975918, ; 238: Microsoft.Maui.Controls.dll => 0xfea12dee => 43
	i32 4292120959 ; 239: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 68
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [240 x i32] [
	i32 110, ; 0
	i32 33, ; 1
	i32 47, ; 2
	i32 103, ; 3
	i32 76, ; 4
	i32 30, ; 5
	i32 31, ; 6
	i32 88, ; 7
	i32 2, ; 8
	i32 30, ; 9
	i32 54, ; 10
	i32 15, ; 11
	i32 51, ; 12
	i32 14, ; 13
	i32 110, ; 14
	i32 94, ; 15
	i32 34, ; 16
	i32 26, ; 17
	i32 85, ; 18
	i32 64, ; 19
	i32 113, ; 20
	i32 99, ; 21
	i32 13, ; 22
	i32 7, ; 23
	i32 42, ; 24
	i32 39, ; 25
	i32 21, ; 26
	i32 62, ; 27
	i32 19, ; 28
	i32 107, ; 29
	i32 83, ; 30
	i32 1, ; 31
	i32 16, ; 32
	i32 4, ; 33
	i32 104, ; 34
	i32 49, ; 35
	i32 97, ; 36
	i32 91, ; 37
	i32 25, ; 38
	i32 41, ; 39
	i32 100, ; 40
	i32 90, ; 41
	i32 86, ; 42
	i32 28, ; 43
	i32 85, ; 44
	i32 75, ; 45
	i32 38, ; 46
	i32 3, ; 47
	i32 55, ; 48
	i32 92, ; 49
	i32 87, ; 50
	i32 80, ; 51
	i32 113, ; 52
	i32 16, ; 53
	i32 22, ; 54
	i32 72, ; 55
	i32 20, ; 56
	i32 18, ; 57
	i32 58, ; 58
	i32 2, ; 59
	i32 50, ; 60
	i32 63, ; 61
	i32 93, ; 62
	i32 32, ; 63
	i32 75, ; 64
	i32 59, ; 65
	i32 0, ; 66
	i32 65, ; 67
	i32 67, ; 68
	i32 6, ; 69
	i32 91, ; 70
	i32 56, ; 71
	i32 42, ; 72
	i32 90, ; 73
	i32 10, ; 74
	i32 5, ; 75
	i32 109, ; 76
	i32 25, ; 77
	i32 69, ; 78
	i32 78, ; 79
	i32 61, ; 80
	i32 95, ; 81
	i32 109, ; 82
	i32 105, ; 83
	i32 79, ; 84
	i32 96, ; 85
	i32 106, ; 86
	i32 51, ; 87
	i32 57, ; 88
	i32 23, ; 89
	i32 1, ; 90
	i32 117, ; 91
	i32 76, ; 92
	i32 39, ; 93
	i32 118, ; 94
	i32 17, ; 95
	i32 64, ; 96
	i32 9, ; 97
	i32 69, ; 98
	i32 80, ; 99
	i32 79, ; 100
	i32 73, ; 101
	i32 40, ; 102
	i32 29, ; 103
	i32 26, ; 104
	i32 92, ; 105
	i32 8, ; 106
	i32 84, ; 107
	i32 35, ; 108
	i32 5, ; 109
	i32 0, ; 110
	i32 101, ; 111
	i32 66, ; 112
	i32 4, ; 113
	i32 105, ; 114
	i32 98, ; 115
	i32 52, ; 116
	i32 82, ; 117
	i32 89, ; 118
	i32 45, ; 119
	i32 12, ; 120
	i32 41, ; 121
	i32 40, ; 122
	i32 99, ; 123
	i32 81, ; 124
	i32 95, ; 125
	i32 14, ; 126
	i32 82, ; 127
	i32 36, ; 128
	i32 8, ; 129
	i32 74, ; 130
	i32 18, ; 131
	i32 115, ; 132
	i32 102, ; 133
	i32 96, ; 134
	i32 112, ; 135
	i32 35, ; 136
	i32 13, ; 137
	i32 10, ; 138
	i32 89, ; 139
	i32 49, ; 140
	i32 114, ; 141
	i32 116, ; 142
	i32 43, ; 143
	i32 11, ; 144
	i32 107, ; 145
	i32 20, ; 146
	i32 81, ; 147
	i32 101, ; 148
	i32 61, ; 149
	i32 15, ; 150
	i32 104, ; 151
	i32 54, ; 152
	i32 56, ; 153
	i32 21, ; 154
	i32 44, ; 155
	i32 45, ; 156
	i32 67, ; 157
	i32 77, ; 158
	i32 65, ; 159
	i32 27, ; 160
	i32 47, ; 161
	i32 6, ; 162
	i32 59, ; 163
	i32 19, ; 164
	i32 77, ; 165
	i32 117, ; 166
	i32 46, ; 167
	i32 115, ; 168
	i32 78, ; 169
	i32 98, ; 170
	i32 88, ; 171
	i32 63, ; 172
	i32 34, ; 173
	i32 70, ; 174
	i32 118, ; 175
	i32 86, ; 176
	i32 12, ; 177
	i32 71, ; 178
	i32 111, ; 179
	i32 57, ; 180
	i32 48, ; 181
	i32 7, ; 182
	i32 97, ; 183
	i32 62, ; 184
	i32 72, ; 185
	i32 24, ; 186
	i32 108, ; 187
	i32 50, ; 188
	i32 60, ; 189
	i32 116, ; 190
	i32 74, ; 191
	i32 3, ; 192
	i32 37, ; 193
	i32 114, ; 194
	i32 11, ; 195
	i32 87, ; 196
	i32 119, ; 197
	i32 24, ; 198
	i32 23, ; 199
	i32 108, ; 200
	i32 31, ; 201
	i32 93, ; 202
	i32 102, ; 203
	i32 66, ; 204
	i32 28, ; 205
	i32 71, ; 206
	i32 36, ; 207
	i32 119, ; 208
	i32 33, ; 209
	i32 70, ; 210
	i32 53, ; 211
	i32 52, ; 212
	i32 84, ; 213
	i32 106, ; 214
	i32 38, ; 215
	i32 103, ; 216
	i32 48, ; 217
	i32 32, ; 218
	i32 83, ; 219
	i32 60, ; 220
	i32 58, ; 221
	i32 112, ; 222
	i32 73, ; 223
	i32 55, ; 224
	i32 27, ; 225
	i32 9, ; 226
	i32 94, ; 227
	i32 44, ; 228
	i32 111, ; 229
	i32 46, ; 230
	i32 100, ; 231
	i32 22, ; 232
	i32 17, ; 233
	i32 37, ; 234
	i32 29, ; 235
	i32 68, ; 236
	i32 53, ; 237
	i32 43, ; 238
	i32 68 ; 239
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}