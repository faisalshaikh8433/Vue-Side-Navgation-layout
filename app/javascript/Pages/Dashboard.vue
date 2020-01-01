<template>
  <PageLayout>
    <template v-slot:heading>Dashboard</template>
    <p class="font-bold">There are {{ items.length }} items.</p>
    <div class="table mt-5">
      <table>
        <thead>
          <tr class="border bg-gray-200">
            <th class="px-4 py-2">Name</th>
            <th class="px-4 py-2">Available</th>
            <th class="px-4 py-2"></th>
          </tr>
        </thead>
        <tbody>
          <tr class="hover:bg-teal-200 font-bold" v-for="item in items" :key="item.id">
            <td class="border px-4 py-2">{{ item.name }}</td>
            <td class="border px-4 py-2">{{ item.active ? "Yes" : "No" }}</td>
            <td class="border px-4 py-2">
              <router-link
                :to="`/items/edit/${item.id}`"
                class="p-2 rounded bg-blue-400 hover:bg-black hover:text-white font-bold"
              >Edit</router-link>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </PageLayout>
</template>

<script>
import PageLayout from "../components/PageLayout";
import api from "../api";
export default {
  data: function() {
    return {
      items: []
    };
  },
  components: {
    PageLayout
  },
  mounted() {
    api
      .get("api/v1/dashboard")
      .then(response => (this.items = response.data))
      .catch(error => console.log(errors.response.data));
  }
};
</script>
