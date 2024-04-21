<template>
  <container>
    <v-toolbar color="#b9f6ca">
      <v-app-bar-nav-icon></v-app-bar-nav-icon>

      <v-toolbar-title>상품관리</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon>
        <v-icon>mdi-magnify</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-heart</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-dots-vertical</v-icon>
      </v-btn>
    </v-toolbar>
    <v-expansion-panels v-model="panel" :disabled="disabled">
      <v-expansion-panel>
        <v-expansion-panel-title>
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> 이미지 </v-col>
          </v-row>
        </v-expansion-panel-title>
        <v-expansion-panel-text>
          <v-card
            class="mx-auto"
            elevation="10"
            max-width="700"
            max-height="700"
          >
            <v-carousel v-if="uploadedFiles.length == 0" show-arrows="hover">
            </v-carousel>
            <v-carousel v-if="uploadedFiles.length > 0" show-arrows="hover">
              <template v-for="(item, i) in uploadedFiles" :key="i">
                <v-carousel-item
                  :src="item.url"
                  aspect-ratio="1"
                ></v-carousel-item>
              </template>
            </v-carousel>
          </v-card>
        </v-expansion-panel-text>
        <v-expansion-panel-text>
          <v-file-input
            accept="image/*"
            multiple
            color="green-accent-1"
            label="이미지 파일"
            density="compact"
            variant="solo"
            @change.prevent="onSelectedFiles($event)"
          ></v-file-input>
        </v-expansion-panel-text>
      </v-expansion-panel>

      <v-expansion-panel>
        <v-expansion-panel-title>
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> 상세정보 </v-col>
          </v-row>
        </v-expansion-panel-title>
        <v-expansion-panel-text>
          <v-table>
            <tbody>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">상품명</td>
                <td colspan="5">
                  <v-text-field
                    label="상품명"
                    hide-details
                    variant="outlined"
                    density="compact"
                    color="green-accent-1"
                    v-model="name"
                  >
                  </v-text-field>
                </td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">
                  카테고리명
                </td>
                <td colspan="5">
                  <v-text-field
                    hide-details
                    label="카테고리명"
                    variant="outlined"
                    density="compact"
                    color="green-accent-1"
                    :items="categories"
                  >
                  </v-text-field>
                </td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">상품상태</td>
                <td colspan="2">
                  <v-row>
                    <v-col sm="8">
                      <v-select
                        label="상품상태"
                        hide-details
                        variant="outlined"
                        density="compact"
                        color="green-accent-1"
                        :items="state"
                      >
                      </v-select>
                    </v-col>
                    <v-col sm="2">
                      <v-btn
                        color="green-accent-1"
                        style="width: 100px; height: 40px"
                        >저장</v-btn
                      >
                    </v-col>
                  </v-row>
                </td>
                <td colspan="1" style="background-color: #b9f6ca">
                  스타일넘버
                </td>
                <td colspan="2">
                  <v-text-field
                    label="스타일넘버"
                    hide-details
                    variant="outlined"
                    density="compact"
                    color="green-accent-1"
                  >
                  </v-text-field>
                </td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">판매가</td>
                <td colspan="2">
                  <v-text-field
                    label="판매가"
                    hide-details
                    variant="outlined"
                    density="compact"
                    color="green-accent-1"
                    suffix="원"
                  >
                  </v-text-field>
                </td>
                <td colspan="1" style="background-color: #b9f6ca">원가</td>
                <td colspan="2">
                  <v-text-field
                    label="원가"
                    hide-details
                    variant="outlined"
                    density="compact"
                    color="green-accent-1"
                    suffix="원"
                  >
                  </v-text-field>
                </td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">마진율</td>
                <td colspan="2">
                  <v-text-field
                    label="마진율"
                    hide-details
                    variant="outlined"
                    density="compact"
                    color="green-accent-1"
                    suffix="%"
                  >
                  </v-text-field>
                </td>
                <td colspan="1" style="background-color: #b9f6ca">과세</td>
                <td colspan="2">
                  <v-select
                    label="과세"
                    hide-details
                    variant="outlined"
                    density="compact"
                    color="green-accent-1"
                    :items="['과세', '면세']"
                  >
                  </v-select>
                </td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">제조사</td>
                <td colspan="2">
                  <v-text-field
                    label="제조사"
                    hide-details
                    variant="outlined"
                    density="compact"
                    color="green-accent-1"
                  >
                  </v-text-field>
                </td>
                <td colspan="1" style="background-color: #b9f6ca">원산지</td>
                <td colspan="2">
                  <v-text-field
                    label="원산지"
                    hide-details
                    variant="outlined"
                    density="compact"
                    color="green-accent-1"
                  >
                  </v-text-field>
                </td>
              </tr>
            </tbody>
          </v-table>
          <v-divider></v-divider>
        </v-expansion-panel-text>
      </v-expansion-panel>

      <v-expansion-panel>
        <v-expansion-panel-title>
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> 옵션 </v-col>
          </v-row>
        </v-expansion-panel-title>
        <v-expansion-panel-text>
          <v-radio-group v-model="options" inline @change="onChangeOption">
            <v-radio
              label="단일옵션"
              value="singleOption"
              color="green-accent-1"
            ></v-radio>
            <v-radio
              label="조합옵션"
              value="matrixOption"
              color="green-accent-1"
            ></v-radio>
          </v-radio-group>
          <template v-if="options === 'singleOption'">
            <v-row>
              <v-col cols="12" sm="6">
                <v-text-field
                  label="옵션"
                  variant="outlined"
                  color="green-accent-1"
                  density="compact"
                  v-model="size"
                  @keydown.enter="addSize"
                >
                  <template v-slot:prepend-inner>
                    <div v-for="(optionText, index) in optionData" :key="index">
                      <v-chip color="green-accent-1" closable>{{
                        optionText
                      }}</v-chip>
                    </div>
                  </template>
                </v-text-field>
              </v-col>
            </v-row>
          </template>
          <template v-if="options === 'matrixOption'">
            <v-row>
              <v-col cols="12" sm="6">
                <v-text-field
                  label="사이즈"
                  variant="outlined"
                  color="green-accent-1"
                  density="compact"
                  v-model="size"
                  @keydown.enter="addSize"
                >
                  <template v-slot:prepend-inner>
                    <div v-for="(sizeText, index) in sizeData" :key="index">
                      <v-chip color="green-accent-1" closable>{{
                        sizeText
                      }}</v-chip>
                    </div>
                  </template>
                </v-text-field>
              </v-col>
              <v-col cols="12" sm="6">
                <v-text-field
                  label="컬러"
                  variant="outlined"
                  color="green-accent-1"
                  density="compact"
                  v-model="color"
                  @keydown.enter="addColor"
                >
                  <template v-slot:prepend-inner>
                    <div v-for="(colorText, index) in colorData" :key="index">
                      <v-chip color="green-accent-1" closable>{{
                        colorText
                      }}</v-chip>
                    </div>
                  </template>
                </v-text-field>
              </v-col>
            </v-row>
          </template>
          <v-row>
            <div ref="single_table"></div>
          </v-row>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="secondary" variant="text"> UnLoad </v-btn>
            <v-btn color="primary" variant="text" @click="loadItems">
              Load
            </v-btn>
          </v-card-actions>
        </v-expansion-panel-text>
      </v-expansion-panel>

      <v-expansion-panel>
        <v-expansion-panel-title>
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> 상세이미지 </v-col>
          </v-row>
        </v-expansion-panel-title>
        <v-expansion-panel-text>
          <v-card>
            <QuillEditor theme="snow" style="height: 500px" />
          </v-card>
        </v-expansion-panel-text>
      </v-expansion-panel>
    </v-expansion-panels>
  </container>
</template>
<script>
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
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
      categories: [
        "상의 > 블라우스",
        "상의 > 티셔츠",
        "상의 > 니트",
        "하의 > 슬랙스",
        "하의 > 청바지",
      ],
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
  },
};
</script>
