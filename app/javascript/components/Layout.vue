<template>
  <div>
    <Header class="shadow bg-gray-200 h-10" @toggleNav="toggleDisplayValue" />
    <div>
      <SideNav
        class="w-64 h-full absolute overflow-x-hidden bg-gray-200 lg:block"
        :class="showSideNav ? 'block' : 'hidden'"
      />
      <main class="p-4 overflow-y-auto" :class="showSideNav ? 'ml-64' : 'ml-0'">
        <router-view></router-view>
      </main>
    </div>
  </div>
</template>

<script>
import Header from "./Header";
import SideNav from "./SideNav";
export default {
  components: {
    Header,
    SideNav
  },
  data: function() {
    return {
      showSideNav: true
    };
  },
  methods: {
    toggleDisplayValue() {
      this.showSideNav = !this.showSideNav;
    }
  }
};
</script>
