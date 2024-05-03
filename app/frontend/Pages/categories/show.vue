<template>
  <container>
    <v-toolbar color="green-accent-1">
      <v-app-bar-nav-icon></v-app-bar-nav-icon>

      <v-toolbar-title>카테고리</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn
        icon
        @click="category !== null ? updateCategory() : saveCategory()"
      >
        <v-icon>mdi-content-save-plus-outline</v-icon>
      </v-btn>
    </v-toolbar>
    <v-divider></v-divider>
    <v-expansion-panels v-model="panel" :disabled="disabled" eager>
      <v-expansion-panel>
        <v-expansion-panel-title>
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> 기본정보 </v-col>
          </v-row>
        </v-expansion-panel-title>
        <v-expansion-panel-text>
          <v-table>
            <thead></thead>
            <tbody>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">코드</td>
                <td colspan="2">
                  {{ category_id }}
                </td>
                <td colspan="1" style="background-color: #b9f6ca">
                  상위 카테고리
                </td>
                <td colspan="2">
                  <v-select
                    hide-details
                    label="카테고리"
                    class="align-self-center"
                    variant="outlined"
                    density="compact"
                    color="green-accent-1"
                    v-model="parent_name"
                    v-bind="{ disabled }"
                    :items="
                      ['미선택'].concat(
                        pCategories.map((category) => category.name),
                      )
                    "
                    :items-value="
                      [''].concat(
                        pCategories.map((category) => category.category_id),
                      )
                    "
                    @update:modelValue="onChangePcategory($event)"
                  ></v-select>
                </td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">
                  카테고리명
                </td>
                <td colspan="5">
                  <v-text-field
                    v-model="name"
                    hide-details
                    label="카테고리명"
                    variant="outlined"
                    density="compact"
                    color="green-accent-1"
                  >
                  </v-text-field>
                </td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">사용여부</td>
                <td colspan="5">
                  <v-radio-group v-model="use_yn" inline hide-details>
                    <v-radio
                      label="사용"
                      value="Y"
                      color="green-accent-1"
                    ></v-radio>
                    <v-radio
                      label="미사용"
                      value="N"
                      color="green-accent-1"
                    ></v-radio>
                  </v-radio-group>
                </td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">등록자</td>
                <td colspan="1">
                  {{ category !== null ? category.register_id : "" }}
                </td>
                <td colspan="1" style="background-color: #b9f6ca">등록일시</td>
                <td colspan="1">
                  {{ category !== null ? category.create_at : "" }}
                </td>
                <td colspan="1" style="background-color: #b9f6ca">수정일시</td>
                <td colspan="1">
                  {{ category !== null ? category.update_at : "" }}
                </td>
              </tr>
            </tbody>
          </v-table>
        </v-expansion-panel-text>
      </v-expansion-panel>
    </v-expansion-panels>
    <v-divider></v-divider>
  </container>
</template>
<script>
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
import axios from "axios";

export default {
  name: "show",
  components: {
    QuillEditor,
  },
  props: {
    pCategories: {
      type: Array,
      required: true,
    },
    nextId: {
      type: String,
      required: true,
    },
    category: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      parent_name:
        this.category !== null ? this.category.parent_name : "미선택",
      disabled: this.category !== null ? true : false,
      parent_id: this.category !== null ? this.category.parent_id : "",
      category_id:
        this.category !== null ? this.category.category_id : this.nextId,
      name: this.category !== null ? this.category.name : "",
      use_yn: this.category !== null ? this.category.use_yn : "Y",
      panel: [0],
    };
  },
  mounted() {},
  methods: {
    saveCategory() {
      axios
        .post("/categories/create", {
          category_id: this.category_id,
          name: this.name,
          parent_id: this.parent_id,
          use_yn: this.use_yn,
        })
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    updateCategory() {
      axios
        .put(`/categories/${this.category_id}/edit`, {
          category_id: this.category_id,
          name: this.name,
          use_yn: this.use_yn,
        })
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    onChangePcategory(value) {
      if (value === "미선택") {
        this.parent_id = "";
        this.category_id = this.nextId;
        return;
      }

      this.parent_id = this.pCategories.filter(
        (category) => category.name === value,
      )[0].category_id;

      this.category_id = this.pCategories.filter(
        (category) => category.name === value,
      )[0].nextId;
    },
  },
};
</script>
