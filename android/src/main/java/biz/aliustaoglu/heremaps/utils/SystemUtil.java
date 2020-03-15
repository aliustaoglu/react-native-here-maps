package biz.aliustaoglu.heremaps.utils;

import android.content.Context;
import android.util.DisplayMetrics;

public class SystemUtil {
    Context context;

    public SystemUtil(Context context){
        this.context = context;
    }

    public float getScaledDensity(){
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        return displayMetrics.scaledDensity;
    }

    public DisplayMetrics getDisplayMetrics (){
        return context.getResources().getDisplayMetrics();

    }}
