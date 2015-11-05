#undef TRACE_SYSTEM
#define TRACE_SYSTEM signal

#if !defined(LTTNG_TRACE_SIGNAL_H) || defined(TRACE_HEADER_MULTI_READ)
#define LTTNG_TRACE_SIGNAL_H

#include "../../../probes/lttng-tracepoint-event.h"
#include <linux/version.h>

#ifndef _TRACE_SIGNAL_DEF
#define _TRACE_SIGNAL_DEF
#include <linux/signal.h>
#include <linux/sched.h>
#undef TP_STORE_SIGINFO
#define TP_STORE_SIGINFO(info)					\
		tp_assign(errno,				\
			(info == SEND_SIG_NOINFO || info == SEND_SIG_FORCED || info == SEND_SIG_PRIV) ? \
			0 :					\
			info->si_errno)				\
		tp_assign(code,					\
			(info == SEND_SIG_NOINFO || info == SEND_SIG_FORCED) ? \
			SI_USER : 				\
			((info == SEND_SIG_PRIV) ? SI_KERNEL : info->si_code))
#endif /* _TRACE_SIGNAL_DEF */

/**
 * signal_generate - called when a signal is generated
 * @sig: signal number
 * @info: pointer to struct siginfo
 * @task: pointer to struct task_struct
 *
 * Current process sends a 'sig' signal to 'task' process with
 * 'info' siginfo. If 'info' is SEND_SIG_NOINFO or SEND_SIG_PRIV,
 * 'info' is not a pointer and you can't access its field. Instead,
 * SEND_SIG_NOINFO means that si_code is SI_USER, and SEND_SIG_PRIV
 * means that si_code is SI_KERNEL.
 */
#if (LINUX_VERSION_CODE < KERNEL_VERSION(3,4,0))
LTTNG_TRACEPOINT_EVENT(signal_generate,

	TP_PROTO(int sig, struct siginfo *info, struct task_struct *task),

	TP_ARGS(sig, info, task),

	TP_STRUCT__entry(
		__field(	int,	sig			)
		__field(	int,	errno			)
		__field(	int,	code			)
		__array_text(	char,	comm,	TASK_COMM_LEN	)
		__field(	pid_t,	pid			)
	),

	TP_fast_assign(
		tp_assign(sig, sig)
		TP_STORE_SIGINFO(info)
		tp_memcpy(comm, task->comm, TASK_COMM_LEN)
		tp_assign(pid, task->pid)
	),

	TP_printk("sig=%d errno=%d code=%d comm=%s pid=%d",
		  __entry->sig, __entry->errno, __entry->code,
		  __entry->comm, __entry->pid)
)
#else
LTTNG_TRACEPOINT_EVENT(signal_generate,

	TP_PROTO(int sig, struct siginfo *info, struct task_struct *task,
			int group, int result),

	TP_ARGS(sig, info, task, group, result),

	TP_STRUCT__entry(
		__field(	int,	sig			)
		__field(	int,	errno			)
		__field(	int,	code			)
		__array_text(	char,	comm,	TASK_COMM_LEN	)
		__field(	pid_t,	pid			)
		__field(	int,	group			)
		__field(	int,	result			)
	),

	TP_fast_assign(
		tp_assign(sig, sig)
		TP_STORE_SIGINFO(info)
		tp_memcpy(comm, task->comm, TASK_COMM_LEN)
		tp_assign(pid, task->pid)
		tp_assign(group, group)
		tp_assign(result, result)
	),

	TP_printk("sig=%d errno=%d code=%d comm=%s pid=%d grp=%d res=%d",
		  __entry->sig, __entry->errno, __entry->code,
		  __entry->comm, __entry->pid, __entry->group,
		  __entry->result)
)
#endif

/**
 * signal_deliver - called when a signal is delivered
 * @sig: signal number
 * @info: pointer to struct siginfo
 * @ka: pointer to struct k_sigaction
 *
 * A 'sig' signal is delivered to current process with 'info' siginfo,
 * and it will be handled by 'ka'. ka->sa.sa_handler can be SIG_IGN or
 * SIG_DFL.
 * Note that some signals reported by signal_generate tracepoint can be
 * lost, ignored or modified (by debugger) before hitting this tracepoint.
 * This means, this can show which signals are actually delivered, but
 * matching generated signals and delivered signals may not be correct.
 */
LTTNG_TRACEPOINT_EVENT(signal_deliver,

	TP_PROTO(int sig, struct siginfo *info, struct k_sigaction *ka),

	TP_ARGS(sig, info, ka),

	TP_STRUCT__entry(
		__field(	int,		sig		)
		__field(	int,		errno		)
		__field(	int,		code		)
		__field(	unsigned long,	sa_handler	)
		__field(	unsigned long,	sa_flags	)
	),

	TP_fast_assign(
		tp_assign(sig, sig)
		TP_STORE_SIGINFO(info)
		tp_assign(sa_handler, (unsigned long)ka->sa.sa_handler)
		tp_assign(sa_flags, ka->sa.sa_flags)
	),

	TP_printk("sig=%d errno=%d code=%d sa_handler=%lx sa_flags=%lx",
		  __entry->sig, __entry->errno, __entry->code,
		  __entry->sa_handler, __entry->sa_flags)
)

#if (LINUX_VERSION_CODE < KERNEL_VERSION(3,4,0))
LTTNG_TRACEPOINT_EVENT_CLASS(signal_queue_overflow,

	TP_PROTO(int sig, int group, struct siginfo *info),

	TP_ARGS(sig, group, info),

	TP_STRUCT__entry(
		__field(	int,	sig	)
		__field(	int,	group	)
		__field(	int,	errno	)
		__field(	int,	code	)
	),

	TP_fast_assign(
		tp_assign(sig, sig)
		tp_assign(group, group)
		TP_STORE_SIGINFO(info)
	),

	TP_printk("sig=%d group=%d errno=%d code=%d",
		  __entry->sig, __entry->group, __entry->errno, __entry->code)
)

/**
 * signal_overflow_fail - called when signal queue is overflow
 * @sig: signal number
 * @group: signal to process group or not (bool)
 * @info: pointer to struct siginfo
 *
 * Kernel fails to generate 'sig' signal with 'info' siginfo, because
 * siginfo queue is overflow, and the signal is dropped.
 * 'group' is not 0 if the signal will be sent to a process group.
 * 'sig' is always one of RT signals.
 */
LTTNG_TRACEPOINT_EVENT_INSTANCE(signal_queue_overflow, signal_overflow_fail,

	TP_PROTO(int sig, int group, struct siginfo *info),

	TP_ARGS(sig, group, info)
)

/**
 * signal_lose_info - called when siginfo is lost
 * @sig: signal number
 * @group: signal to process group or not (bool)
 * @info: pointer to struct siginfo
 *
 * Kernel generates 'sig' signal but loses 'info' siginfo, because siginfo
 * queue is overflow.
 * 'group' is not 0 if the signal will be sent to a process group.
 * 'sig' is always one of non-RT signals.
 */
LTTNG_TRACEPOINT_EVENT_INSTANCE(signal_queue_overflow, signal_lose_info,

	TP_PROTO(int sig, int group, struct siginfo *info),

	TP_ARGS(sig, group, info)
)
#endif

#endif /* LTTNG_TRACE_SIGNAL_H */

/* This part must be outside protection */
#include "../../../probes/define_trace.h"
