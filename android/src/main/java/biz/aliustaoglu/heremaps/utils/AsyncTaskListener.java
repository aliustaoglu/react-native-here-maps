package biz.aliustaoglu.heremaps.utils;

public interface AsyncTaskListener<T> {
    void onAsyncTaskSuccess(T object);

    void onAsyncTaskFailure(Exception e);
}
