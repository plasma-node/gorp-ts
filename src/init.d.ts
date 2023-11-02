export namespace gorp {
	export function add_world(): void;
	export function check_if_user_allowed(callback: Callback): void;
	export function spawn_widget(name: unknown): void;

	export function server_init(actor?: Actor): void;
	export function compat_set_cts<T>(user_cts: T & { [key: string]: unknown }): T;
}
