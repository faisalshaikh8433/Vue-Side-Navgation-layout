<template>
  <div class="m-2 p-2 shadow">
    <div class="flex bg-gray-300 items-center">
      <div>
        <h1 class="p-2 font-bold">
          <slot name="heading"></slot>
        </h1>
      </div>
      <div class="ml-auto">
        <slot name="link"></slot>
      </div>
    </div>
    <div class="p-2">
      <slot></slot>
    </div>
  </div>
</template>

<script>
export default {};
</script>
