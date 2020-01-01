<template>
  <header>
    <div class="flex justify-center items-center">
      <div class="lg:m-3 w-64 text-center font-bold">
        <p class="text-xl underline">SPA</p>
      </div>
      <div class="ml-auto text-right">
        <button @click="$emit('toggleNav')" class="lg:hidden rounded-r hover:bg-red-200">
          <img src="https://img.icons8.com/plasticine/100/000000/hamburger.png" class="h-10 w-10" />
        </button>
      </div>
    </div>
  </header>
</template>

<script>
export default {};
</script>
