package biz.aliustaoglu.heremaps.utils;

import android.graphics.Bitmap;

import com.here.android.mpa.mapping.MapMarker;

public class MarkerIcon {
    MapMarker mapMarker;
    Bitmap bitmap;

    public MarkerIcon(MapMarker mapMarker, Bitmap bitmap) {
        this.mapMarker = mapMarker;
        this.bitmap = bitmap;
    }

    public MapMarker getMapMarker() {
        return mapMarker;
    }


    public Bitmap getBitmap() {
        return bitmap;
    }

}
