package com.helpshift.support.imageloader;

import java.util.concurrent.LinkedBlockingDeque;

/* JADX INFO: loaded from: classes2.dex */
class LIFOLinkedBlockingDeque<T> extends LinkedBlockingDeque<T> {
    LIFOLinkedBlockingDeque() {
    }

    @Override // java.util.concurrent.LinkedBlockingDeque, java.util.Queue, java.util.concurrent.BlockingDeque, java.util.concurrent.BlockingQueue, java.util.Deque
    public boolean offer(T t) {
        return super.offerFirst(t);
    }

    @Override // java.util.concurrent.LinkedBlockingDeque, java.util.AbstractQueue, java.util.Queue, java.util.concurrent.BlockingDeque, java.util.Deque
    public T remove() {
        return (T) super.removeFirst();
    }
}
