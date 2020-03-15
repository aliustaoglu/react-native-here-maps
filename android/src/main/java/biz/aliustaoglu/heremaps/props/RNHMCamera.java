package biz.aliustaoglu.heremaps.props;

import com.facebook.react.bridge.ReadableMap;
import com.here.android.mpa.common.GeoCoordinate;
import com.here.android.mpa.mapping.Map;

import biz.aliustaoglu.heremaps.views.RNHMHereMapLayout;

public class RNHMCamera {
    Map hereMap;
    RNHMHereMapLayout mapLayout;
    ReadableMap camera;

    public RNHMCamera(){

    }

    public void update(RNHMHereMapLayout mapLayout, ReadableMap camera){
        this.mapLayout = mapLayout;
        this.camera = camera;

        if (mapLayout == null || mapLayout.hereMap == null) return;

        ReadableMap target = camera.getMap("target");
        Double lat = target.getDouble("lat");
        Double lng = target.getDouble("lng");
        GeoCoordinate geoCoordinate = new GeoCoordinate(lat, lng);

        hereMap = mapLayout.hereMap;
        hereMap.setCenter(geoCoordinate, Map.Animation.NONE);

        if (camera.hasKey("zoom")){
            Double zoom = camera.getDouble("zoom");
            hereMap.setZoomLevel(zoom);
        }
    }

    public void refresh(){
        update(mapLayout, camera);
    }



}
