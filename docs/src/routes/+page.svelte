<script lang="ts">
	import { onMount } from 'svelte';
	import Animated from './Animated.svelte';
	import { codes } from './codes';

	let code = $state(codes[0].code);
	let image = $state(codes[0].image);
	let counter = $state(0);

	onMount(() => {
		let interval = setInterval(() => {
			console.log(counter);
			if (counter === codes.length - 1) {
				clearInterval(interval);
			} else {
				counter++;
			}
			code = codes[counter].code;
			image = codes[counter].image;
		}, 400);
		return () => clearInterval(interval);
	});
</script>

<svelte:head>
	<title>Zap – Your Typst Circuit Drawing Companion</title>
</svelte:head>

<div class="flex w-screen flex-col px-5 py-14 md:min-h-screen md:py-20">
	<span class="text-new font-mono">Brand New Package</span>
	<span class="mt-2 max-w-7xl text-4xl font-medium tracking-tight text-balance font-stretch-expanded md:text-8xl">
		Your Typst circuit drawing <span class="icon-[hugeicons--paint-brush-04] -mx-0.5 -mb-2 size-9 md:size-20"></span> companion
	</span>
	<div class="mt-8 flex items-center gap-3">
		<a
			href="/docs"
			class="flex items-center gap-2 rounded-full bg-neutral-900 px-5 py-2 text-white transition hover:bg-neutral-900/90 dark:bg-white dark:text-black dark:hover:bg-white/90"
		>
			<span class="icon-[hugeicons--book-open-02] size-5.5"></span> Documentation
		</a>
		<a
			href="/examples"
			class="rounded-full bg-gray-500 px-5 py-2 text-white transition hover:bg-gray-500/90 dark:bg-gray-600 dark:hover:bg-gray-600/90"
		>
			Examples
		</a>
	</div>
	<div class="mt-20 grid max-w-7xl items-start gap-8 text-left md:grid-cols-2">
		<Animated {code} />
		<div class="dark:border-neutral-border flex min-h-96 items-center justify-center rounded-lg border border-neutral-200">
			<img src={image} alt="circuit" />
		</div>
	</div>
</div>
