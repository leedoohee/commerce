<template>
  <v-toolbar color="green-accent-1">
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
        <v-card class="mx-auto" elevation="10" max-width="700" max-height="700">
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
        <v-row>
          <v-col cols="12" sm="12" style="height: 65px">
            <v-text-field
              label="상품명"
              variant="outlined"
              density="compact"
              color="green-accent-1"
              v-model="name"
            >
            </v-text-field>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12" sm="12" style="height: 65px">
            <v-select
              label="카테고리"
              variant="outlined"
              density="compact"
              color="green-accent-1"
              :items="categories"
            >
            </v-select>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12" sm="5" style="height: 65px">
            <v-select
              label="상품상태"
              variant="outlined"
              density="compact"
              color="green-accent-1"
              :items="state"
            >
            </v-select>
          </v-col>
          <v-col cols="12" sm="1" style="height: 65px">
            <v-btn
              color="green-accent-1"
              variant="plain"
              rounded="lg"
              style="width: 100px; height: 42px;"
              density="compact"
              icon="mdi-check"
            ></v-btn>
          </v-col>
          <v-col cols="12" sm="6" style="height: 65px">
            <v-text-field
              label="스타일넘버"
              variant="outlined"
              density="compact"
              color="green-accent-1"
            >
            </v-text-field>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12" sm="6" style="height: 65px">
            <v-text-field
              label="판매가"
              variant="outlined"
              density="compact"
              color="green-accent-1"
              suffix="원"
            >
            </v-text-field>
          </v-col>
          <v-col cols="12" sm="6" style="height: 65px">
            <v-text-field
              label="원가"
              variant="outlined"
              density="compact"
              color="green-accent-1"
              suffix="원"
            >
            </v-text-field>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12" sm="6" style="height: 65px">
            <v-text-field
              label="마진율"
              variant="outlined"
              density="compact"
              color="green-accent-1"
              suffix="%"
            >
            </v-text-field>
          </v-col>

          <v-col cols="12" sm="6" style="height: 65px">
            <v-select
              label="과세"
              variant="outlined"
              density="compact"
              color="green-accent-1"
              :items="['과세', '면세']"
            >
            </v-select>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12" sm="6" style="height: 80px">
            <v-text-field
              label="제조사"
              variant="outlined"
              density="compact"
              color="green-accent-1"
            >
            </v-text-field>
          </v-col>

          <v-col cols="12" sm="6" style="height: 80px">
            <v-text-field
              label="원산지"
              variant="outlined"
              density="compact"
              color="green-accent-1"
            >
            </v-text-field>
          </v-col>
        </v-row>
      </v-expansion-panel-text>
    </v-expansion-panel>

    <v-expansion-panel>
      <v-expansion-panel-title>
        <v-row no-gutters>
          <v-col class="d-flex justify-start" cols="4"> 옵션 </v-col>
        </v-row>
      </v-expansion-panel-title>
      <v-expansion-panel-text>
        <v-radio-group
          v-model="options"
          inline
        >
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
          <ag-grid-vue
            :rowData="singleItems"
            :columnDefs="singleColDefs"
            @grid-ready="onGridReady"
            style="height: 500px"
            class="ag-theme-quartz"
          ></ag-grid-vue>
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
          <!-- <ag-grid-vue
            :rowData="matrixItems"
            :columnDefs="matrixColDefs"
            @grid-ready="onGridReady"
            style="height: 500px"
            class="ag-theme-quartz"
          ></ag-grid-vue> -->
          <v-data-table
            :group-by="groupBy"
            :headers="headers"
            :items="desserts"
            :sort-by="sortBy"
            class="elevation-1"
            item-value="name"
            group-expand
          >
          </v-data-table>
        </template>
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
</template>
<script>
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
import { AgGridVue } from "ag-grid-vue3";

export default {
  name: "show",
  components: {
    QuillEditor,
    AgGridVue,
  },
  data: () => ({
    sortBy: [{ key: 'name' }],
    groupBy: [{ key: 'dairy' }],
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
        field: "option",
      },
      { field: "quantity" },
      { field: "price" },
    ],
    matrixColDefs: [
      {
        text: 'option',
        align: 'center',
        sortable: false,
        child:["size", "color"]
      },
      { text: 'quantity', sortable: false, align: 'center' },
      { text: 'price', sortable: false, align: 'center' }
    ],
    itemsPerPage: 5,
    options: "singleOption",
    optionData: ['S', 'M', 'L', 'Red', 'Blue', 'Black'],
    matrixItems: [],
    singleItems: [],
    gridApi: null,
    dragover: false,
    uploadedFiles: [],
    dialog: true,
    multiple: true,
    headers: [
      {
        text: "Dessert (100g serving)",
        align: "start",
        value: "name",
        groupable: false,
      },
      { text: "Category", value: "category", align: "right" },
      { text: "Dairy", value: "dairy", align: "right" },
    ],
    search: '',
    desserts: [
    {
        name: "Frozen Yogurt",
        category: "Ice cream",
        dairy: "Yes",
      },
      {
        name: "Ice cream sandwich",
        category: "Ice cream",
        dairy: "Yes",
      },
      {
        name: "Eclair",
        category: "Cookie",
        dairy: "Yes",
      },
      {
        name: "Cupcake",
        category: "Pastry",
        dairy: "Yes",
      },
      {
        name: "Gingerbread",
        category: "Cookie",
        dairy: "No",
      },
      {
        name: "Jelly bean",
        category: "Candy",
        dairy: "No",
      },
      {
        name: "Lollipop",
        category: "Candy",
        dairy: "No",
      },
      {
        name: "Honeycomb",
        category: "Toffee",
        dairy: "No",
      },
      {
        name: "Donut",
        category: "Pastry",
        dairy: "Yes",
      },
      {
        name: "KitKat",
        category: "Candy",
        dairy: "Yes",
      },
    ],
  }),
  methods: {
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
      if(this.options === 'singleOption') {
        for (const option of this.optionData) {
          this.singleItems.push({ option: option, quantity: 0, price: 0 });
        }
      } else {
        for (const size of this.sizeData) {
          for (const color of this.colorData) {
            this.matrixItems.push({ size: size, color: color, quantity: 0, price: 0 });
          }
        }
      }

      const items = this.options === 'singleOption' ? this.singleItems : this.matrixItems;
      this.gridApi.setGridOption("rowData", items);
    },
    onGridReady(params) {
      this.gridApi = params.api;
    },
    onSelectedFiles(event) {
      for (let i = 0; i < event.target.files.length; i++) {
        this.uploadedFiles.push({
          "url": URL.createObjectURL(event.target.files[i]),
          "file": event.target.files[i]
        });
      }
    },
  },
};
</script>
