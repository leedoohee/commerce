<template>
  <container>
    <v-toolbar color="#b9f6ca">
      <v-app-bar-nav-icon></v-app-bar-nav-icon>

      <v-toolbar-title>주문관리</v-toolbar-title>

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
    <v-expansion-panels v-model="panel" :disabled="disabled" multiple>
      <v-expansion-panel>
        <v-expansion-panel-title>
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> 주문자 </v-col>
          </v-row>
        </v-expansion-panel-title>
        <v-expansion-panel-text>
          <v-table>
            <tbody>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">주문자</td>
                <td colspan="2">이두희</td>
                <td colspan="1" style="background-color: #b9f6ca">아이디</td>
                <td colspan="2">doohee14(general)</td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">주문상태</td>
                <td colspan="2">출고완료</td>
                <td colspan="1" style="background-color: #b9f6ca">주문일시</td>
                <td colspan="2">2024.04.19 12:22:35</td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">휴대전화</td>
                <td colspan="2">010-1234-5678</td>
                <td colspan="1" style="background-color: #b9f6ca">이메일</td>
                <td colspan="2">doohee14@gmail.com</td>
              </tr>
            </tbody>
          </v-table>
          <v-divider></v-divider>
        </v-expansion-panel-text>
      </v-expansion-panel>

      <v-expansion-panel>
        <v-expansion-panel-title>
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> 수령자 </v-col>
          </v-row>
        </v-expansion-panel-title>
        <v-expansion-panel-text>
          <v-table>
            <tbody>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">수령자</td>
                <td colspan="2">이두희</td>
                <td colspan="1" style="background-color: #b9f6ca">휴대전화</td>
                <td colspan="2">010-1234-5678</td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">우편번호</td>
                <td colspan="1">출고완료</td>
                <td colspan="1" style="background-color: #b9f6ca">주소</td>
                <td colspan="3">서울특별시 영등포구 여의도동</td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">택배</td>
                <td colspan="1">신한택배</td>
                <td colspan="1" style="background-color: #b9f6ca">송장번호</td>
                <td colspan="1">5325325</td>
                <td colspan="1" style="background-color: #b9f6ca">배송일</td>
                <td colspan="1">2024.04.19 12:22:35</td>
              </tr>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">메시지</td>
                <td colspan="5">부재시, 문앞에 놓아주세요.</td>
              </tr>
            </tbody>
          </v-table>
          <v-divider></v-divider>
        </v-expansion-panel-text>
      </v-expansion-panel>
      
      <v-expansion-panel>
        <v-expansion-panel-title>
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> 결제 </v-col>
          </v-row>
        </v-expansion-panel-title>
        <v-expansion-panel-text>
          <v-table>
            <thead>
              <tr>
                <th colspan="1" style="background-color: #b9f6ca">결제상태</th>
                <th colspan="1" style="background-color: #b9f6ca">결제방법</th>
                <th colspan="1" style="background-color: #b9f6ca">결제일시</th>
                <th colspan="1" style="background-color: #b9f6ca">결제금액</th>
                <th colspan="1" style="background-color: #b9f6ca">할인</th>
                <th colspan="1" style="background-color: #b9f6ca">적립금</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td colspan="1">결제완료</td>
                <td colspan="1">신용카드</td>
                <td colspan="1">2024.04.19 12:22:35</td>
                <td colspan="1">100,000</td>
                <td colspan="1">0</td>
                <td colspan="1">0</td>
              </tr>
            </tbody>
          </v-table>
          <v-divider></v-divider>
        </v-expansion-panel-text>
      </v-expansion-panel>
    
      <v-expansion-panel>
        <v-expansion-panel-title>
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> 상품 </v-col>
          </v-row>
        </v-expansion-panel-title>
        <v-expansion-panel-text eager>
          <v-row>
            <v-col cols="1">
              <v-btn
                color="green-accent-1"
              >주문</v-btn>
            </v-col>
            <v-col cols="1">
              <v-btn
                color="green-accent-1"
              >교환</v-btn>
            </v-col>
            <v-col cols="1">
              <v-btn
                color="green-accent-1"
              >환불</v-btn>
            </v-col>
          </v-row>
          <v-row>
            <div ref="single_table"></div>
          </v-row>
        </v-expansion-panel-text>
      </v-expansion-panel>

      <v-expansion-panel>
        <v-expansion-panel-title>
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> 주문 처리일자 </v-col>
          </v-row>
        </v-expansion-panel-title>
        <v-expansion-panel-text>
          <v-table>
            <tbody>
              <tr>
                <td colspan="1" style="background-color: #b9f6ca">주문일시</td>
                <td colspan="1">2024.04.19 12:22:35</td>
                <td colspan="1" style="background-color: #b9f6ca">입금일시</td>
                <td colspan="1">2024.04.19 12:22:35</td>
                <td colspan="1" style="background-color: #b9f6ca">최종처리일시</td>
                <td colspan="1">2024.04.19 12:22:35</td>
              </tr>
            </tbody>
          </v-table>
          <v-divider></v-divider>
        </v-expansion-panel-text>
      </v-expansion-panel>

      <v-expansion-panel>
        <v-expansion-panel-title>
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> 주문상태 히스토리 </v-col>
          </v-row>
        </v-expansion-panel-title>
        <v-expansion-panel-text>
          <v-table>
            <thead>
              <tr>
                <th colspan="1" style="background-color: #b9f6ca">이전 주문상태</th>
                <th colspan="1" style="background-color: #b9f6ca">변경 주문상태</th>
                <th colspan="3" style="background-color: #b9f6ca">변경일시</th>
                <th colspan="1" style="background-color: #b9f6ca">변경자</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td colspan="1">출고처리중</td>
                <td colspan="1">출고완료</td>
                <td colspan="3">2024.04.19 12:22:35</td>
                <td colspan="1">dooheelee</td>
              </tr>
            </tbody>
          </v-table>
          <v-divider></v-divider>
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
      tabulator: null,
      currentTabItem: '주문',
      tabItems: [
        '주문', '환불', '교환'
      ],
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
      panel: [0, 1, 2, 3, 4, 5, 6],
      uploadDialog: false,
      disabled: false,
      expanded: true,
      productsColDefs: [
        {
          title: "상품상태",
          field: "state",
          hozAlign: "center",
        },
        {
          title: "스타일넘버",
          field: "styleNumber",
          hozAlign: "center",
        },
        {
          title: "상품명",
          field: "name",
          hozAlign: "center",
        },
        {
          title: "이미지",
          field: "img",
          hozAlign: "center",
        },
        {
          title: "판매가",
          field: "price",
          hozAlign: "center",
        },
        {
          title: "주문갯수",
          field: "quantity",
          hozAlign: "center",
        },
        {
          title: "할인",
          field: "discount",
          hozAlign: "center",
        },
        {
          title: "배송비",
          field: "shippingAmt",
          hozAlign: "center",
        },
      ],
      orderProducts: [
        {
          state: "주문완료",
          styleNumber: "123456",
          name: "상품1",
          img: "img1",
          price: "100,000",
          quantity: "1",
          discount: "0",
          shippingAmt: "0",
        },
        {
          state: "주문완료",
          styleNumber: "123457",
          name: "상품2",
          img: "img2",
          price: "100,000",
          quantity: "1",
          discount: "0",
          shippingAmt: "0",
        },
        {
          state: "주문완료",
          styleNumber: "123458",
          name: "상품3",
          img: "img3",
          price: "100,000",
          quantity: "1",
          discount: "0",
          shippingAmt: "0",
        },
        {
          state: "주문완료",
          styleNumber: "123459",
          name: "상품4",
          img: "img4",
          price: "100,000",
          quantity: "1",
          discount: "0",
          shippingAmt: "0",
        },
        {
          state: "주문완료",
          styleNumber: "123460",
          name: "상품5",
          img: "img5",
          price: "100,000",
          quantity: "1",
          discount: "0",
          shippingAmt: "0",
        },
      ],
      itemsPerPage: 5,
      options: "singleOption",
      optionData: ["S", "M", "L", "Red", "Blue", "Black"],
      matrixItems: [],
      singleItems: [],
      uploadedFiles: [],
    };
  },
  mounted() {
    //instantiate Tabulator when element is mounted
    this.tabulator = new Tabulator(this.$refs.single_table, {
      height: 500, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
      data: this.orderProducts, //assign data to table
      layout: "fitColumns", //fit columns to width of table (optional)
      pagination: true, //enable pagination
      paginationMode: "remote", //enable remote pagination
      ajaxURL: "", //set url for ajax request
      dataReceiveParams: {
        last_page: "max_pages", //change last_page parameter name to "max_pages"
      },
      columns: this.productsColDefs,
    });
  },
  methods: {
    onChangeOption() {
      this.options === "singleOption"
        ? this.tabulator.setColumns(this.singleColDefs)
        : this.tabulator.setColumns(this.matrixColDefs);

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

      this.tabulator.setData(items, true);
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
