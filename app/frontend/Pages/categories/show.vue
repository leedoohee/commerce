<template>
  <container>
    <v-toolbar color="green-accent-1">
      <v-app-bar-nav-icon></v-app-bar-nav-icon>

      <v-toolbar-title>카테고리</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon @click="saveCategory">
        <v-icon>mdi-content-save-plus-outline</v-icon>
      </v-btn>

    </v-toolbar>
    <v-divider></v-divider>
    <v-expansion-panels v-model="panel" :disabled="disabled">
      <v-expansion-panel>
        <v-expansion-panel-title>
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> 기본정보 </v-col>
          </v-row>
        </v-expansion-panel-title>
        <v-expansion-panel-text>
          <v-table>
            <thead>
            </thead>
            <tbody>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">코드</td>
                <td colspan="2" :v-model="category_id">001</td>
                <td colspan="1" style="background-color: #b9f6ca">상위 카테고리</td>
                <td colspan="2">
                  <v-select
                    hide-details
                    label="카테고리"
                    class="align-self-center"
                    variant="outlined"
                    density="compact"
                    color="green-accent-1"
                    :items="categories"
                  ></v-select>
                </td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">카테고리명</td>
                <td colspan="5">
                  <v-text-field
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
                  <v-radio-group inline hide-details>
                    <v-radio
                      label="사용"
                      value="singleOption"
                      color="green-accent-1"
                    ></v-radio>
                    <v-radio
                      label="미사용"
                      value="matrixOption"
                      color="green-accent-1"
                    ></v-radio>
                  </v-radio-group>
                </td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">등록자</td>
                <td colspan="1">dooheelee</td>
                <td colspan="1" style="background-color: #b9f6ca">등록일시</td>
                <td colspan="1">2024-04-21 11:24:32</td>
                <td colspan="1" style="background-color: #b9f6ca">수정일시</td>
                <td colspan="1">2024-04-21 11:24:32</td>
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
import { TabulatorFull as Tabulator } from "tabulator-tables"; //import Tabulator library
import "tabulator-tables/dist/css/tabulator_semanticui.css";

export default {
  name: "show",
  components: {
    QuillEditor,
  },
  data() {
    return {
      single_table: null,
      matrix_table: null,
      sizeData: ["S", "M", "L"],
      colorData: ["Blue", "Black", "Red"],
      categories: ["상의", "하의", "신발", "악세사리"],
      state: ["판매중", "품절", "판매중지"],
      panel: [0, 1, 2, 3],
      uploadDialog: false,
      disabled: false,
      expanded: true,
      singleColDefs: [
        {
          title: "옵션",
          field: "option",
          hozAlign: "center",
        },
        { title: "재고", field: "quantity", editor: true, hozAlign: "center" },
        { title: "추가가격", field: "price", editor: true, hozAlign: "center" },
      ],
      itemsPerPage: 5,
      options: "singleOption",
      optionData: ["S", "M", "L", "Red", "Blue", "Black"],
      matrixItems: [],
      singleItems: [],
      uploadedFiles: [],
      matrixColDefs: [
        {
          title: "옵션",
          field: "option",
          hozAlign: "center",
          columns: [
            { title: "사이즈", field: "size", hozAlign: "center" },
            { title: "컬러", field: "color", hozAlign: "center" },
          ],
        },
        { title: "재고", field: "quantity", editor: true, hozAlign: "center" },
        { title: "추가가격", field: "price", editor: true, hozAlign: "center" },
      ],
    };
  },
  mounted() {
    //instantiate Tabulator when element is mounted
    this.single_table = new Tabulator(this.$refs.single_table, {
      nestedFieldSeparator: "|",
      height: 500, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
      data: this.singleItems, //assign data to table
      layout: "fitColumns", //fit columns to width of table (optional)
      pagination: true, //enable pagination
      paginationMode: "remote", //enable remote pagination
      ajaxURL: "", //set url for ajax request
      dataReceiveParams: {
        last_page: "max_pages", //change last_page parameter name to "max_pages"
      },
      columns: this.singleColDefs,
    });
  },
  methods: {
    onChangeOption() {
      this.options === "singleOption"
        ? this.single_table.setColumns(this.singleColDefs)
        : this.single_table.setColumns(this.matrixColDefs);

      this.single_table.setData([]);
    },
    addOption() {
      this.optionData.push(this.size);
      this.size = "";
    },
    addSize() {
      this.sizeData.push(this.size);
      this.size = "";
    },
    addColor() {
      this.colorData.push(this.color);
      this.color = "";
    },
    loadItems() {
      const items = [];
      if (this.options === "singleOption") {
        for (const option of this.optionData) {
          items.push({ option: option, quantity: 0, price: 0 });
        }
      } else {
        for (const size of this.sizeData) {
          for (const color of this.colorData) {
            items.push({
              size: size,
              color: color,
              quantity: 0,
              price: 0,
            });
          }
        }
      }

      this.single_table.setData(items, true);
    },
    onSelectedFiles(event) {
      for (let i = 0; i < event.target.files.length; i++) {
        this.uploadedFiles.push({
          url: URL.createObjectURL(event.target.files[i]),
          file: event.target.files[i],
        });
      }
    },
    saveCategory() {
      axios.post("/categories/new", {
        category_id: '001001',
        name: '스웨터',
        parent_id: '001',
        use_yn: 'Y'
      }).then((response) => {
        console.log(response);
      }).catch((error) => {
        console.log(error);
      })
    },
  },
};
</script>
