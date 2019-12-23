<template>
  <header>
    <div class="shadow-xl bg-gray-300 flex p-2">
      <div>
        <a href="/" class="text-xl font-bold">Demo</a>
        <button
          @click="$emit('toggleNav')"
          class="lg:hidden p-1 rounded-r hover:bg-red-200"
        >Hide/Show</button>
      </div>
      <div class="ml-auto font-semi-bold">
        <a>Hello User</a>
      </div>
    </div>
  </header>
</template>

<script>
export default {};
</script>