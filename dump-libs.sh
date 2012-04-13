#!/bin/sh

for i in stagefright media utils binder cutils; do
	nm -D --defined-only lib$i.so | awk '{print $3}' | grep -v ^__aeabi | grep '\(IInterface\|OMXObserver\|MemoryDealer\|Binder\|RefBase\|String\|OMXClient\|IMemory\|^str\|android_log_print\|^property_\|^socket_\)' > lib$i.symbols
done

