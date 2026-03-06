package com.helpshift.common.domain;

import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: loaded from: classes2.dex */
public class One extends F {
    private final F f;
    private final AtomicBoolean running = new AtomicBoolean(false);

    public One(F f) {
        this.f = f;
    }

    @Override // com.helpshift.common.domain.F
    public void f() {
        if (this.running.compareAndSet(false, true)) {
            try {
                this.f.f();
            } finally {
                this.running.set(false);
            }
        }
    }

    public F getF() {
        return this.f;
    }
}
