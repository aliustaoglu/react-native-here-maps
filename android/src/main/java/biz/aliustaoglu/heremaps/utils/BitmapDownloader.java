package biz.aliustaoglu.heremaps.utils;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;

import com.here.android.mpa.mapping.MapMarker;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

public class BitmapDownloader extends AsyncTask<Object, Void, MarkerIcon> {

    AsyncTaskListener<MarkerIcon> listener;
    Bitmap bitmap = null;
    URL url = null;

    public BitmapDownloader(AsyncTaskListener listener){
        this.listener = listener;
    }


    @Override
    protected MarkerIcon doInBackground(Object... objects) {
        final String url = (String) objects[0];
        MapMarker mapMarker = (MapMarker) objects[1];

        try {
            final InputStream inputStream = new URL(url).openStream();
            bitmap = BitmapFactory.decodeStream(inputStream);
        } catch (final MalformedURLException malformedUrlException) {
            listener.onAsyncTaskFailure(malformedUrlException);
        } catch (final IOException ioException) {
            listener.onAsyncTaskFailure(ioException);
        }
        MarkerIcon markerIcon = new MarkerIcon(mapMarker, bitmap);
        return markerIcon;
    }



    @Override
    protected void onPostExecute(MarkerIcon result) {
        listener.onAsyncTaskSuccess(result);
    }
}