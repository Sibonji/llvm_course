; ModuleID = 'src/app.c'
source_filename = "src/app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@arr_len = external local_unnamed_addr global i32, align 4

; Function Attrs: noreturn nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = load i32, i32* @arr_len, align 4, !tbaa !5
  %2 = zext i32 %1 to i64
  %3 = mul nuw i64 %2, %2
  %4 = alloca i32, i64 %3, align 16
  %5 = alloca i32, i64 %3, align 16
  call void @create_arr(i32* noundef nonnull %4)
  %6 = load i32, i32* @arr_len, align 4, !tbaa !5
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %48

8:                                                ; preds = %0
  %9 = zext i32 %6 to i64
  %10 = shl nuw nsw i64 %9, 2
  %11 = and i64 %9, 1
  %12 = icmp eq i32 %6, 1
  br i1 %12, label %38, label %13

13:                                               ; preds = %8
  %14 = and i64 %9, 4294967294
  br label %15

15:                                               ; preds = %15, %13
  %16 = phi i64 [ 0, %13 ], [ %33, %15 ]
  %17 = phi i64 [ 0, %13 ], [ %34, %15 ]
  %18 = trunc i64 %16 to i32
  %19 = mul i32 %6, %18
  %20 = sext i32 %19 to i64
  %21 = getelementptr i32, i32* %4, i64 %20
  %22 = bitcast i32* %21 to i8*
  %23 = getelementptr i32, i32* %5, i64 %20
  %24 = bitcast i32* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %24, i8* align 8 %22, i64 %10, i1 false), !tbaa !5
  %25 = trunc i64 %16 to i32
  %26 = or i32 %25, 1
  %27 = mul i32 %6, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr i32, i32* %4, i64 %28
  %30 = bitcast i32* %29 to i8*
  %31 = getelementptr i32, i32* %5, i64 %28
  %32 = bitcast i32* %31 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %32, i8* align 4 %30, i64 %10, i1 false), !tbaa !5
  %33 = add nuw nsw i64 %16, 2
  %34 = add i64 %17, 2
  %35 = icmp eq i64 %34, %14
  br i1 %35, label %36, label %15, !llvm.loop !9

36:                                               ; preds = %15
  %37 = trunc i64 %33 to i32
  br label %38

38:                                               ; preds = %36, %8
  %39 = phi i32 [ 0, %8 ], [ %37, %36 ]
  %40 = icmp eq i64 %11, 0
  br i1 %40, label %48, label %41

41:                                               ; preds = %38
  %42 = mul i32 %6, %39
  %43 = sext i32 %42 to i64
  %44 = getelementptr i32, i32* %4, i64 %43
  %45 = bitcast i32* %44 to i8*
  %46 = getelementptr i32, i32* %5, i64 %43
  %47 = bitcast i32* %46 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %47, i8* align 4 %45, i64 %10, i1 false), !tbaa !5
  br label %48

48:                                               ; preds = %41, %38, %0
  call void @fill_pixels_with_arr(i32* noundef nonnull %4) #5
  br label %49

49:                                               ; preds = %49, %48
  call void @save_new_gen(i32* noundef nonnull %4, i32* noundef nonnull %5)
  call void @fill_pixels_with_arr(i32* noundef nonnull %4) #5
  call void (...) @update_window() #5
  br label %49
}

; Function Attrs: nounwind uwtable
define dso_local void @create_arr(i32* nocapture noundef %0) local_unnamed_addr #1 {
  %2 = load i32, i32* @arr_len, align 4, !tbaa !5
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %8

4:                                                ; preds = %1, %47
  %5 = phi i32 [ %48, %47 ], [ %2, %1 ]
  %6 = phi i32 [ %49, %47 ], [ 0, %1 ]
  %7 = icmp sgt i32 %5, 0
  br i1 %7, label %51, label %47

8:                                                ; preds = %47, %1
  %9 = phi i32 [ %2, %1 ], [ %48, %47 ]
  %10 = add nsw i32 %9, -1
  %11 = mul nsw i32 %10, %9
  %12 = add nsw i32 %11, -2
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32* %0, i64 %13
  %15 = load i32, i32* %14, align 4, !tbaa !5
  store i32 %15, i32* %0, align 4, !tbaa !5
  %16 = load i32, i32* @arr_len, align 4, !tbaa !5
  %17 = add nsw i32 %16, -2
  %18 = mul nsw i32 %17, %16
  %19 = add nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32* %0, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !5
  %23 = add nsw i32 %16, -1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32* %0, i64 %24
  store i32 %22, i32* %25, align 4, !tbaa !5
  %26 = load i32, i32* @arr_len, align 4, !tbaa !5
  %27 = shl nsw i32 %26, 1
  %28 = add nsw i32 %27, -2
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32* %0, i64 %29
  %31 = load i32, i32* %30, align 4, !tbaa !5
  %32 = add nsw i32 %26, -1
  %33 = mul nsw i32 %32, %26
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32* %0, i64 %34
  store i32 %31, i32* %35, align 4, !tbaa !5
  %36 = load i32, i32* @arr_len, align 4, !tbaa !5
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32* %0, i64 %38
  %40 = load i32, i32* %39, align 4, !tbaa !5
  %41 = mul nsw i32 %36, %36
  %42 = add nsw i32 %41, -1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32* %0, i64 %43
  store i32 %40, i32* %44, align 4, !tbaa !5
  %45 = load i32, i32* @arr_len, align 4, !tbaa !5
  %46 = icmp sgt i32 %45, 2
  br i1 %46, label %65, label %91

47:                                               ; preds = %51, %4
  %48 = phi i32 [ %5, %4 ], [ %61, %51 ]
  %49 = add nuw nsw i32 %6, 1
  %50 = icmp slt i32 %49, %48
  br i1 %50, label %4, label %8, !llvm.loop !11

51:                                               ; preds = %4, %51
  %52 = phi i32 [ %60, %51 ], [ 0, %4 ]
  %53 = tail call i32 (...) @sim_rand() #5
  %54 = srem i32 %53, 2
  %55 = load i32, i32* @arr_len, align 4, !tbaa !5
  %56 = mul nsw i32 %55, %6
  %57 = add nsw i32 %56, %52
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32* %0, i64 %58
  store i32 %54, i32* %59, align 4, !tbaa !5
  %60 = add nuw nsw i32 %52, 1
  %61 = load i32, i32* @arr_len, align 4, !tbaa !5
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %51, label %47, !llvm.loop !12

63:                                               ; preds = %65
  %64 = icmp sgt i32 %87, 2
  br i1 %64, label %92, label %91

65:                                               ; preds = %8, %65
  %66 = phi i64 [ %86, %65 ], [ 1, %8 ]
  %67 = phi i32 [ %87, %65 ], [ %45, %8 ]
  %68 = add nsw i32 %67, -2
  %69 = mul nsw i32 %68, %67
  %70 = trunc i64 %66 to i32
  %71 = add nsw i32 %69, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32* %0, i64 %72
  %74 = load i32, i32* %73, align 4, !tbaa !5
  %75 = getelementptr inbounds i32, i32* %0, i64 %66
  store i32 %74, i32* %75, align 4, !tbaa !5
  %76 = load i32, i32* @arr_len, align 4, !tbaa !5
  %77 = add nsw i32 %76, %70
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32* %0, i64 %78
  %80 = load i32, i32* %79, align 4, !tbaa !5
  %81 = add nsw i32 %76, -1
  %82 = mul nsw i32 %81, %76
  %83 = add nsw i32 %82, %70
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32* %0, i64 %84
  store i32 %80, i32* %85, align 4, !tbaa !5
  %86 = add nuw nsw i64 %66, 1
  %87 = load i32, i32* @arr_len, align 4, !tbaa !5
  %88 = add nsw i32 %87, -1
  %89 = sext i32 %88 to i64
  %90 = icmp slt i64 %86, %89
  br i1 %90, label %65, label %63, !llvm.loop !13

91:                                               ; preds = %92, %8, %63
  ret void

92:                                               ; preds = %63, %92
  %93 = phi i32 [ %114, %92 ], [ %87, %63 ]
  %94 = phi i32 [ %113, %92 ], [ 1, %63 ]
  %95 = mul nsw i32 %93, %94
  %96 = add nsw i32 %93, -2
  %97 = add nsw i32 %96, %95
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32* %0, i64 %98
  %100 = load i32, i32* %99, align 4, !tbaa !5
  %101 = sext i32 %95 to i64
  %102 = getelementptr inbounds i32, i32* %0, i64 %101
  store i32 %100, i32* %102, align 4, !tbaa !5
  %103 = load i32, i32* @arr_len, align 4, !tbaa !5
  %104 = mul nsw i32 %103, %94
  %105 = add nsw i32 %104, 1
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32* %0, i64 %106
  %108 = load i32, i32* %107, align 4, !tbaa !5
  %109 = add nsw i32 %103, -1
  %110 = add nsw i32 %109, %104
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32* %0, i64 %111
  store i32 %108, i32* %112, align 4, !tbaa !5
  %113 = add nuw nsw i32 %94, 1
  %114 = load i32, i32* @arr_len, align 4, !tbaa !5
  %115 = add nsw i32 %114, -1
  %116 = icmp slt i32 %113, %115
  br i1 %116, label %92, label %91, !llvm.loop !14
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @save_first_gen(i32* nocapture noundef readonly %0, i32* nocapture noundef writeonly %1) local_unnamed_addr #2 {
  %3 = load i32, i32* @arr_len, align 4, !tbaa !5
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %9

5:                                                ; preds = %2, %10
  %6 = phi i32 [ %11, %10 ], [ %3, %2 ]
  %7 = phi i32 [ %12, %10 ], [ 0, %2 ]
  %8 = icmp sgt i32 %6, 0
  br i1 %8, label %14, label %10

9:                                                ; preds = %10, %2
  ret void

10:                                               ; preds = %14, %5
  %11 = phi i32 [ %6, %5 ], [ %24, %14 ]
  %12 = add nuw nsw i32 %7, 1
  %13 = icmp slt i32 %12, %11
  br i1 %13, label %5, label %9, !llvm.loop !9

14:                                               ; preds = %5, %14
  %15 = phi i32 [ %24, %14 ], [ %6, %5 ]
  %16 = phi i32 [ %23, %14 ], [ 0, %5 ]
  %17 = mul nsw i32 %15, %7
  %18 = add nsw i32 %17, %16
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32* %0, i64 %19
  %21 = load i32, i32* %20, align 4, !tbaa !5
  %22 = getelementptr inbounds i32, i32* %1, i64 %19
  store i32 %21, i32* %22, align 4, !tbaa !5
  %23 = add nuw nsw i32 %16, 1
  %24 = load i32, i32* @arr_len, align 4, !tbaa !5
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %14, label %10, !llvm.loop !15
}

declare void @fill_pixels_with_arr(i32* noundef) local_unnamed_addr #3

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @save_new_gen(i32* nocapture noundef %0, i32* nocapture noundef %1) local_unnamed_addr #2 {
  %3 = load i32, i32* @arr_len, align 4, !tbaa !5
  %4 = add nsw i32 %3, -1
  %5 = icmp sgt i32 %3, 2
  br i1 %5, label %6, label %16

6:                                                ; preds = %2, %55
  %7 = phi i32 [ %58, %55 ], [ %3, %2 ]
  %8 = phi i32 [ %57, %55 ], [ 1, %2 ]
  %9 = icmp sgt i32 %7, 2
  br i1 %9, label %13, label %10

10:                                               ; preds = %6
  %11 = add nuw nsw i32 %8, 1
  %12 = add nsw i32 %7, -1
  br label %55

13:                                               ; preds = %6
  %14 = add nsw i32 %8, -1
  %15 = add nuw nsw i32 %8, 1
  br label %60

16:                                               ; preds = %55, %2
  %17 = phi i32 [ %3, %2 ], [ %58, %55 ]
  %18 = phi i32 [ %4, %2 ], [ %56, %55 ]
  %19 = mul nsw i32 %18, %17
  %20 = add nsw i32 %19, -2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32* %1, i64 %21
  %23 = load i32, i32* %22, align 4, !tbaa !5
  store i32 %23, i32* %1, align 4, !tbaa !5
  %24 = load i32, i32* @arr_len, align 4, !tbaa !5
  %25 = add nsw i32 %24, -2
  %26 = mul nsw i32 %25, %24
  %27 = add nsw i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32* %1, i64 %28
  %30 = load i32, i32* %29, align 4, !tbaa !5
  %31 = add nsw i32 %24, -1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32* %1, i64 %32
  store i32 %30, i32* %33, align 4, !tbaa !5
  %34 = load i32, i32* @arr_len, align 4, !tbaa !5
  %35 = shl nsw i32 %34, 1
  %36 = add nsw i32 %35, -2
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32* %1, i64 %37
  %39 = load i32, i32* %38, align 4, !tbaa !5
  %40 = add nsw i32 %34, -1
  %41 = mul nsw i32 %40, %34
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32* %1, i64 %42
  store i32 %39, i32* %43, align 4, !tbaa !5
  %44 = load i32, i32* @arr_len, align 4, !tbaa !5
  %45 = add nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32* %1, i64 %46
  %48 = load i32, i32* %47, align 4, !tbaa !5
  %49 = mul nsw i32 %44, %44
  %50 = add nsw i32 %49, -1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32* %1, i64 %51
  store i32 %48, i32* %52, align 4, !tbaa !5
  %53 = load i32, i32* @arr_len, align 4, !tbaa !5
  %54 = icmp sgt i32 %53, 2
  br i1 %54, label %127, label %153

55:                                               ; preds = %117, %10
  %56 = phi i32 [ %12, %10 ], [ %123, %117 ]
  %57 = phi i32 [ %11, %10 ], [ %15, %117 ]
  %58 = phi i32 [ %7, %10 ], [ %122, %117 ]
  %59 = icmp slt i32 %57, %56
  br i1 %59, label %6, label %16, !llvm.loop !16

60:                                               ; preds = %13, %117
  %61 = phi i32 [ %7, %13 ], [ %122, %117 ]
  %62 = phi i32 [ 1, %13 ], [ %121, %117 ]
  %63 = mul nsw i32 %61, %8
  %64 = add nsw i32 %63, %62
  %65 = add nsw i32 %64, -1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32* %0, i64 %66
  %68 = load i32, i32* %67, align 4, !tbaa !5
  %69 = add nsw i32 %64, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32* %0, i64 %70
  %72 = load i32, i32* %71, align 4, !tbaa !5
  %73 = add nsw i32 %72, %68
  %74 = mul nsw i32 %61, %14
  %75 = add nsw i32 %74, %62
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32* %0, i64 %76
  %78 = load i32, i32* %77, align 4, !tbaa !5
  %79 = add nsw i32 %73, %78
  %80 = mul nsw i32 %61, %15
  %81 = add nsw i32 %80, %62
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32* %0, i64 %82
  %84 = load i32, i32* %83, align 4, !tbaa !5
  %85 = add nsw i32 %79, %84
  %86 = add nsw i32 %75, -1
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32* %0, i64 %87
  %89 = load i32, i32* %88, align 4, !tbaa !5
  %90 = add nsw i32 %85, %89
  %91 = add nsw i32 %75, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32* %0, i64 %92
  %94 = load i32, i32* %93, align 4, !tbaa !5
  %95 = add nsw i32 %90, %94
  %96 = add nsw i32 %81, -1
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32* %0, i64 %97
  %99 = load i32, i32* %98, align 4, !tbaa !5
  %100 = add nsw i32 %95, %99
  %101 = add nsw i32 %81, 1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i32, i32* %0, i64 %102
  %104 = load i32, i32* %103, align 4, !tbaa !5
  %105 = add nsw i32 %100, %104
  switch i32 %105, label %106 [
    i32 3, label %108
    i32 2, label %110
  ]

106:                                              ; preds = %60
  %107 = sext i32 %64 to i64
  br label %115

108:                                              ; preds = %60
  %109 = sext i32 %64 to i64
  br label %117

110:                                              ; preds = %60
  %111 = sext i32 %64 to i64
  %112 = getelementptr inbounds i32, i32* %0, i64 %111
  %113 = load i32, i32* %112, align 4, !tbaa !5
  %114 = icmp eq i32 %113, 1
  br i1 %114, label %117, label %115

115:                                              ; preds = %106, %110
  %116 = phi i64 [ %107, %106 ], [ %111, %110 ]
  br label %117

117:                                              ; preds = %110, %115, %108
  %118 = phi i64 [ %116, %115 ], [ %109, %108 ], [ %111, %110 ]
  %119 = phi i32 [ 0, %115 ], [ 1, %108 ], [ 1, %110 ]
  %120 = getelementptr inbounds i32, i32* %1, i64 %118
  store i32 %119, i32* %120, align 4, !tbaa !5
  %121 = add nuw nsw i32 %62, 1
  %122 = load i32, i32* @arr_len, align 4, !tbaa !5
  %123 = add nsw i32 %122, -1
  %124 = icmp slt i32 %121, %123
  br i1 %124, label %60, label %55, !llvm.loop !17

125:                                              ; preds = %127
  %126 = icmp sgt i32 %149, 2
  br i1 %126, label %156, label %153

127:                                              ; preds = %16, %127
  %128 = phi i64 [ %148, %127 ], [ 1, %16 ]
  %129 = phi i32 [ %149, %127 ], [ %53, %16 ]
  %130 = add nsw i32 %129, -2
  %131 = mul nsw i32 %130, %129
  %132 = trunc i64 %128 to i32
  %133 = add nsw i32 %131, %132
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32* %1, i64 %134
  %136 = load i32, i32* %135, align 4, !tbaa !5
  %137 = getelementptr inbounds i32, i32* %1, i64 %128
  store i32 %136, i32* %137, align 4, !tbaa !5
  %138 = load i32, i32* @arr_len, align 4, !tbaa !5
  %139 = add nsw i32 %138, %132
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32* %1, i64 %140
  %142 = load i32, i32* %141, align 4, !tbaa !5
  %143 = add nsw i32 %138, -1
  %144 = mul nsw i32 %143, %138
  %145 = add nsw i32 %144, %132
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32* %1, i64 %146
  store i32 %142, i32* %147, align 4, !tbaa !5
  %148 = add nuw nsw i64 %128, 1
  %149 = load i32, i32* @arr_len, align 4, !tbaa !5
  %150 = add nsw i32 %149, -1
  %151 = sext i32 %150 to i64
  %152 = icmp slt i64 %148, %151
  br i1 %152, label %127, label %125, !llvm.loop !18

153:                                              ; preds = %156, %16, %125
  %154 = phi i32 [ %149, %125 ], [ %53, %16 ], [ %178, %156 ]
  %155 = icmp sgt i32 %154, 0
  br i1 %155, label %181, label %185

156:                                              ; preds = %125, %156
  %157 = phi i32 [ %178, %156 ], [ %149, %125 ]
  %158 = phi i32 [ %177, %156 ], [ 1, %125 ]
  %159 = mul nsw i32 %157, %158
  %160 = add nsw i32 %157, -2
  %161 = add nsw i32 %160, %159
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i32, i32* %1, i64 %162
  %164 = load i32, i32* %163, align 4, !tbaa !5
  %165 = sext i32 %159 to i64
  %166 = getelementptr inbounds i32, i32* %1, i64 %165
  store i32 %164, i32* %166, align 4, !tbaa !5
  %167 = load i32, i32* @arr_len, align 4, !tbaa !5
  %168 = mul nsw i32 %167, %158
  %169 = add nsw i32 %168, 1
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i32, i32* %1, i64 %170
  %172 = load i32, i32* %171, align 4, !tbaa !5
  %173 = add nsw i32 %167, -1
  %174 = add nsw i32 %173, %168
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i32, i32* %1, i64 %175
  store i32 %172, i32* %176, align 4, !tbaa !5
  %177 = add nuw nsw i32 %158, 1
  %178 = load i32, i32* @arr_len, align 4, !tbaa !5
  %179 = add nsw i32 %178, -1
  %180 = icmp slt i32 %177, %179
  br i1 %180, label %156, label %153, !llvm.loop !19

181:                                              ; preds = %153, %186
  %182 = phi i32 [ %187, %186 ], [ %154, %153 ]
  %183 = phi i32 [ %188, %186 ], [ 0, %153 ]
  %184 = icmp sgt i32 %182, 0
  br i1 %184, label %190, label %186

185:                                              ; preds = %186, %153
  ret void

186:                                              ; preds = %190, %181
  %187 = phi i32 [ %182, %181 ], [ %200, %190 ]
  %188 = add nuw nsw i32 %183, 1
  %189 = icmp slt i32 %188, %187
  br i1 %189, label %181, label %185, !llvm.loop !20

190:                                              ; preds = %181, %190
  %191 = phi i32 [ %200, %190 ], [ %182, %181 ]
  %192 = phi i32 [ %199, %190 ], [ 0, %181 ]
  %193 = mul nsw i32 %191, %183
  %194 = add nsw i32 %193, %192
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i32, i32* %1, i64 %195
  %197 = load i32, i32* %196, align 4, !tbaa !5
  %198 = getelementptr inbounds i32, i32* %0, i64 %195
  store i32 %197, i32* %198, align 4, !tbaa !5
  %199 = add nuw nsw i32 %192, 1
  %200 = load i32, i32* @arr_len, align 4, !tbaa !5
  %201 = icmp slt i32 %199, %200
  br i1 %201, label %190, label %186, !llvm.loop !21
}

declare void @update_window(...) local_unnamed_addr #3

declare i32 @sim_rand(...) local_unnamed_addr #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { noreturn nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !10}
!17 = distinct !{!17, !10}
!18 = distinct !{!18, !10}
!19 = distinct !{!19, !10}
!20 = distinct !{!20, !10}
!21 = distinct !{!21, !10}
