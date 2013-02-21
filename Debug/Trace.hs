module Debug.Trace (
        -- * Tracing
        -- $tracing
        trace,
        traceShow,
        traceStack,
        traceIO,
        putTraceMsg,

        -- * Eventlog tracing
        -- $eventlog_tracing
        traceEvent,
        traceEventIO,
        
        -- * Execution phase markers
        -- $markers
        traceMarker,
        traceMarkerIO,
  ) where
