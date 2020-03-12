package biz.aliustaoglu.heremaps;

import androidx.annotation.Nullable;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

import biz.aliustaoglu.heremaps.props.RNHMCamera;
import biz.aliustaoglu.heremaps.props.RNHMMarkers;
import biz.aliustaoglu.heremaps.views.RNHMHereMapLayout;

public class RNHMReactNativeHereMapsManager extends SimpleViewManager<RNHMHereMapLayout> {

    public static final String REACT_CLASS = "RNHMReactNativeHereMaps";
    RNHMHereMapLayout rnhmHereMapLayout;


    @Override
    public String getName() {
        return REACT_CLASS;
    }

    @Override
    public RNHMHereMapLayout createViewInstance(ThemedReactContext context) {
        rnhmHereMapLayout = new RNHMHereMapLayout(context);

        rnhmHereMapLayout.rnhmCamera = new RNHMCamera();
        rnhmHereMapLayout.rnhmMarkers = new RNHMMarkers();

        return rnhmHereMapLayout;
    }

    @ReactProp(name = "camera")
    public void setCamera(RNHMHereMapLayout mapLayout, ReadableMap camera) {
        rnhmHereMapLayout.rnhmCamera.update(mapLayout, camera);
    }

    @ReactProp(name = "markers")
    public void setMarkers(RNHMHereMapLayout mapLayout, ReadableArray markers) {
        rnhmHereMapLayout.rnhmMarkers.update(mapLayout, markers);
    }
}
