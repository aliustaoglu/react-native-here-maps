package biz.aliustaoglu.heremaps.views;

import android.view.ViewGroup;
import android.widget.LinearLayout;

import androidx.fragment.app.FragmentActivity;

import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.uimanager.ThemedReactContext;
import com.here.android.mpa.common.ApplicationContext;
import com.here.android.mpa.common.MapEngine;
import com.here.android.mpa.common.OnEngineInitListener;
import com.here.android.mpa.mapping.AndroidXMapFragment;
import com.here.android.mpa.mapping.Map;
import com.here.android.mpa.mapping.MapView;

import java.io.File;

import biz.aliustaoglu.heremaps.R;
import biz.aliustaoglu.heremaps.props.RNHMCamera;
import biz.aliustaoglu.heremaps.props.RNHMMarkers;

public class RNHMHereMapLayout extends LinearLayout implements OnEngineInitListener {
    ThemedReactContext context;
    public Map hereMap;
    MapView mapView;

    public Boolean isMapReady = false;

    // Props
    public RNHMCamera rnhmCamera;
    public RNHMMarkers rnhmMarkers;

    public RNHMHereMapLayout(ThemedReactContext context) {
        super(context);
        this.context = context;
        LinearLayout layout = (LinearLayout) inflate(context, R.layout.mapview_layout, this);
//        // Start Map Service for disk caching (That also allows offline)

        boolean success = com.here.android.mpa.common.MapSettings.setIsolatedDiskCacheRootPath(
                context.getApplicationContext().getExternalFilesDir(null) + File.separator + ".here-maps",
                "RNHMServiceIntent");

        MapEngine mapEngine = MapEngine.getInstance();
        mapEngine.init(new ApplicationContext(context), this);
        mapView = layout.findViewById(R.id.mapView);
        mapView.onResume();
    }


    @Override
    public void onEngineInitializationCompleted(Error error) {
        isMapReady = true;
        this.hereMap = new Map();
        mapView.setMap(this.hereMap);
        this.hereMap.setMapScheme(Map.Scheme.TRUCK_DAY);


        rnhmCamera.refresh();
    }
}
