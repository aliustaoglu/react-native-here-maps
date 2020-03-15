package biz.aliustaoglu.heremaps.props;

import android.graphics.Bitmap;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.here.android.mpa.common.GeoCoordinate;
import com.here.android.mpa.common.Image;
import com.here.android.mpa.mapping.Map;
import com.here.android.mpa.mapping.MapMarker;

import biz.aliustaoglu.heremaps.utils.AsyncTaskListener;
import biz.aliustaoglu.heremaps.utils.BitmapDownloader;
import biz.aliustaoglu.heremaps.utils.MarkerIcon;
import biz.aliustaoglu.heremaps.utils.SystemUtil;
import biz.aliustaoglu.heremaps.views.RNHMHereMapLayout;

public class RNHMMarkers implements AsyncTaskListener<MarkerIcon> {
    Map hereMap;
    RNHMHereMapLayout mapLayout;
    ReadableArray markers;
    SystemUtil systemUtil;

    public RNHMMarkers() {

    }

    public void update(RNHMHereMapLayout mapLayout, ReadableArray markers) {
        this.mapLayout = mapLayout;
        this.markers = markers;

        if (mapLayout == null || mapLayout.hereMap == null) return;
        hereMap = mapLayout.hereMap;

        for (int i = 0; i < markers.size(); i++) {
            ReadableMap markerItem = markers.getMap(i);
            addMarker(markerItem);
        }

    }

    public void refresh() {
        update(mapLayout, markers);
    }

    private void addMarker(ReadableMap readableMarker) {
        MapMarker mapMarker = new MapMarker();

        Double lat = readableMarker.getDouble("lat");
        Double lng = readableMarker.getDouble("lng");
        mapMarker.setCoordinate(new GeoCoordinate(lat, lng));

        if (readableMarker.hasKey("icon")) {
            setMarkerIcon(mapMarker, readableMarker);
        }

        hereMap.addMapObject(mapMarker);
    }

    private void setMarkerIcon(MapMarker mapMarker, ReadableMap readableMarker) {
        ReadableMap readableIcon = readableMarker.getMap("icon");
        String url = readableIcon.getString("uri");
        BitmapDownloader bd = new BitmapDownloader(this);
        bd.execute(url, mapMarker);
    }

    @Override
    public void onAsyncTaskSuccess(MarkerIcon markerIcon) {
        systemUtil = new SystemUtil(mapLayout.getContext());
        MapMarker mapMarker = markerIcon.getMapMarker();
        Bitmap bitmap = markerIcon.getBitmap();
        float scaledDensity = systemUtil.getScaledDensity();
        Bitmap scaledBitmap = Bitmap.createScaledBitmap(bitmap, Math.round(bitmap.getWidth() * scaledDensity), Math.round(bitmap.getHeight() * scaledDensity), false);
        Image image = new Image();
        image.setBitmap(scaledBitmap);
        mapMarker.setIcon(image);

    }

    @Override
    public void onAsyncTaskFailure(Exception e) {
        // Default blue marker will be assigned, so no need to handle anything here
    }
}
