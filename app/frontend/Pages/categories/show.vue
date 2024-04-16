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
  <v-expansion-panels
    v-model="panel"
    :disabled="disabled"
  >
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
        >
          <v-carousel show-arrows="hover">
            <v-carousel-item
              src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
              cover
            ></v-carousel-item>

            <v-carousel-item
              src="https://cdn.vuetifyjs.com/images/cards/hotel.jpg"
              cover
            ></v-carousel-item>

            <v-carousel-item
              src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg"
              cover
            ></v-carousel-item>
          </v-carousel>
        </v-card>
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
          <v-col
            cols="12"
            sm="12"
            style="height: 75px;"
          >
            <v-text-field
              label="상품명" 
              variant="outlined"
              color="green-accent-1"
              v-model="name"
            >
            </v-text-field>
          </v-col>
        </v-row>

        <v-row>
          <v-col
            cols="12"
            sm="12"
            style="height: 75px;"
          >
            <v-select
              label="카테고리" 
              variant="outlined"
              color="green-accent-1"
              :items="categories"
            >
            </v-select>
          </v-col>
        </v-row>

        <v-row>
          <v-col
            cols="12"
            sm="5"
            style="height: 75px;"
          >
            <v-select
              label="상품상태" 
              variant="outlined"
              color="green-accent-1"
              :items="state"
            >
            </v-select>
          </v-col>
          <v-col
            cols="12"
            sm="1"
            style="height: 75px;"
          >
            <v-btn color="green-accent-1" variant="plain" rounded="lg" style="width: 100px; height: 58px;" icon="mdi-check"></v-btn>
          </v-col> 
          <v-col
            cols="12"
            sm="6"
            style="height: 75px;"
          >
            <v-text-field
              label="스타일넘버" 
              variant="outlined"
              color="green-accent-1"
            >
            </v-text-field>
          </v-col>
        </v-row>
        
        <v-row>
          <v-col
            cols="12"
            sm="6"
            style="height: 75px;"
          >
            <v-text-field
              label="판매가" 
              variant="outlined"
              color="green-accent-1"
              suffix="원"
            >
            </v-text-field>
          </v-col>
          <v-col
            cols="12"
            sm="6"
            style="height: 75px;"
          >
            <v-text-field
              label="원가" 
              variant="outlined"
              color="green-accent-1"
              suffix="원"
            >
            </v-text-field>
          </v-col>
        </v-row>

        <v-row>
          <v-col
            cols="12"
            sm="6"
            style="height: 75px;"
          >
            <v-text-field
              label="마진율" 
              variant="outlined"
              color="green-accent-1"
              suffix="%"
            >
            </v-text-field>
          </v-col>

          <v-col
            cols="12"
            sm="6"
            style="height: 75px;"
          >
            <v-select
              label="과세" 
              variant="outlined"
              color="green-accent-1"
              :items = "
              [
                '과세',
                '면세'
              ]"
            >
            </v-select>
          </v-col>
        </v-row>
        
        <v-row>
          <v-col
            cols="12"
            sm="6"
            style="height: 90px;"
          >
            <v-text-field
              label="제조사" 
              variant="outlined"
              color="green-accent-1"
            >
            </v-text-field>
          </v-col>

          <v-col
            cols="12"
            sm="6"
            style="height: 90px;"
          >
            <v-text-field
              label="원산지" 
              variant="outlined"
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
        <v-row>
          <v-col
            cols="12"
            sm="6"
          >
            <v-text-field
              label="사이즈" 
              variant="outlined"
              color="green-accent-1"
              v-model="size"
              @keydown.enter="addSize"
            >
              <template v-slot:prepend-inner>
                <div v-for="(sizeText , index) in sizeData" :key="index">
                  <v-chip color="green-accent-1" closable>{{sizeText}}</v-chip>
                </div>
              </template>
            </v-text-field>
          </v-col>
          <v-col
            cols="12"
            sm="6"
          >
            <v-text-field
              label="컬러" 
              variant="outlined"
              color="green-accent-1"
              v-model="color"
              @keydown.enter="addColor"
            >
              <template v-slot:prepend-inner>
                <div v-for="(colorText , index) in colorData" :key="index">
                  <v-chip color="green-accent-1" closable>{{colorText}}</v-chip>
                </div>
              </template>
            </v-text-field>
          </v-col>
        </v-row>
        <ag-grid-vue
          :rowData="items"
          :columnDefs="colDefs"
          @grid-ready="onGridReady"
          style="height: 500px"
          class="ag-theme-quartz"
        ></ag-grid-vue>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="secondary" variant="text"> UnLoad </v-btn>
          <v-btn color="primary" variant="text" @click="loadItems"> Load </v-btn>
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
          <QuillEditor theme="snow" style="height: 500px;"/>
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
    AgGridVue
  },
  data: () => ({
    trip: {
      name: "",
      location: null,
      start: null,
      end: null,
    },
    sizeData: ['S', 'M', 'L'],
    colorData: ['Blue', 'Black', 'Red'],
    categories: [
      "상의 > 블라우스",
      "상의 > 티셔츠",
      "상의 > 니트",
      "하의 > 슬랙스",
      "하의 > 청바지",
    ],
    state: [
      "판매중",
      "품절",
      "판매중지",
    ],
    panel: [0, 1, 2, 3],
    disabled: false,
    expanded: true,
    colDefs: [
      { field: "option", 
        checkboxSelection: true,
        children: [
          { field: "size" },
          { field: "color" }
        ]
      },
      { field: "quantity" },
      { field: "price" },
    ],
    items: [

    ],
    gridApi: null
  }),
  methods: {
    addSize() {
      this.sizeData.push(this.size);
      this.size = "";
    },
    addColor() {
      this.colorData.push(this.color);
      this.color = "";
    },
    loadItems() {
      for(const size of this.sizeData) {
        for(const color of this.colorData) {
          this.items.push({ size: size, color: color, quantity: 0, price: 0 });
        }
      }

      this.gridApi.setGridOption("rowData", this.items);
    },
    onGridReady(params) {
      this.gridApi = params.api;
    },
  }
}
</script>
