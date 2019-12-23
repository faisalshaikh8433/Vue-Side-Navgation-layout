<template>
  <div id="app">
    <Header @toggleNav="toggleDisplayValue" />
    <div>
      <SideNav
        class="w-64 h-full absolute overflow-x-hidden bg-gray-300 lg:block"
        :class="showSideNav ? 'block' : 'hidden'"
      />
      <Main class="p-4 bg-red-100 overflow-y-auto" :class="showSideNav ? 'ml-64' : 'ml-0'">
        <slot></slot>
      </Main>
    </div>
  </div>
</template>

<script>
import Header from "./packs/components/Header";
import SideNav from "./packs/components/SideNav";
import Main from "./packs/components/Main";
export default {
  components: {
    Header,
    SideNav,
    Main
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

