<template>
  <PageLayout>
    <template v-slot:heading>Items</template>
    <template v-slot:link>
      <router-link
        to="items/new"
        class="p-2 rounded bg-blue-400 hover:bg-black hover:text-white font-bold"
      >New Item</router-link>
    </template>
    <div
      v-if="showNotice"
      class="m-1 mb-1 p-2 flex items-center rounded bg-green-300 text-green-800"
    >
      <p>{{ notice }}</p>
      <span class="ml-auto hover:text-black hover:bg-white p-1" @click="hideNotification">x</span>
    </div>
    <div v-if="alert" class="m-1 mb-1 p-2 flex items-center rounded bg-red-300 text-red-800">
      <p>{{ alertMessage }}</p>
      <span class="ml-auto hover:text-black hover:bg-white p-1" @click="hideNotification">x</span>
    </div>
    <div class="table">
      <table class="table-auto">
        <thead>
          <tr class="border bg-gray-200">
            <th class="px-4 py-2">Name</th>
            <th class="px-4 py-2">Available</th>
            <th class="px-4 py-2" colspan="2">Actions</th>
          </tr>
        </thead>
        <tbody>
          <TableRow
            @deleteItem="deleteItem(item.id)"
            v-for="item in items"
            :key="item.id"
            :item="item"
          />
        </tbody>
      </table>
    </div>
  </PageLayout>
</template>

<script>
import PageLayout from "../../components/PageLayout";
import api from "../../api";
import TableRow from "./TableRow";
export default {
  props: ["notice"],
  data: function() {
    return {
      items: [],
      alert: false,
      alertMessage: "",
      showNotice: this.notice
    };
  },
  components: {
    PageLayout,
    TableRow
  },
  methods: {
    deleteItem(itemId) {
      this.items = this.items.filter(item => item.id != itemId);
      this.showNotice = false;
      this.alert = true;
      this.alertMessage = "Deleted Successfully !";
    },
    hideNotification() {
      this.alert = false;
      this.alertMessage = "";
      this.showNotice = false;
    }
  },
  mounted() {
    api
      .get("api/v1/items")
      .then(response => (this.items = response.data))
      .catch(error => console.log(errors.response.data));
  }
};
</script>
