<template>
  <PageLayout>
    <template v-slot:heading>New Item</template>
    <div class="m-1">
      <label>Name</label>
      <Input
        ref="userInput"
        v-model="form.item.name"
        :errorMessage="errorMessage"
        :errors="errors.name"
      />
      <ErrorMessage v-show="hasErrorMessage" error-message="Can't be blank !" />
    </div>
    <div class="m-1">
      <label>Available</label>
      <input type="checkbox" v-model="form.item.active" />
    </div>
    <button
      class="p-2 rounded bg-blue-400 hover:bg-black hover:text-white font-bold"
      @click="saveItem"
    >Save</button>
  </PageLayout>
</template>

<script>
import PageLayout from "../../components/PageLayout";
import ErrorMessage from "../../components/ErrorMessage";
import Input from "../../components/Input";
import api from "../../api";
export default {
  data: function() {
    return {
      form: {
        item: {
          name: "",
          active: true
        }
      },
      errorMessage: false,
      errors: {}
    };
  },
  components: {
    Input,
    PageLayout,
    ErrorMessage
  },
  methods: {
    saveItem() {
      if (this.form.item.name != "") {
        api
          .put(`api/v1/items/${this.$route.params.id}`, this.form)
          .then(response => {
            this.$router.push({
              name: "items",
              params: { notice: "Updated succesfully!" }
            });
          })
          .catch(error => {
            this.errors = error.response.data.errors;
            console.log(error.response.data.errors);
          });
      } else {
        this.errorMessage = true;
      }
    }
  },
  watch: {
    form: {
      // This will let Vue know to look inside the array
      deep: true,

      // We have to move our method to a handler field
      handler() {
        if (this.form.item.name != "") {
          this.errorMessage = false;
        }
      }
    }
  },
  computed: {
    hasErrorMessage() {
      return this.errorMessage;
    }
  },
  mounted() {
    // console.log(this.$refs.userInput.$refs.input);
    this.$nextTick(() => {
      this.$refs.userInput.$refs.input.focus();
      api
        .get(`api/v1/items/${this.$route.params.id}/edit`)
        .then(response => (this.form.item = response.data))
        .catch(error => console.log(errors.response.data));
    });
  }
};
</script>

<style scoped></style>
