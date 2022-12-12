<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="text-center text-white" style="background-color: #0a4275;">
            <div class="container p-5">
                <div class="row">
                    <div class="col-md-4">
                        <img src="assets/img/github.png" height="50" class="d-inline-block align-top"/>
                    </div>
                    <div class="col-md-4">
                        <img src="assets/img/chess-piece.png" width="50" height="50" class="d-inline-block align-top" alt="">
                        <span style="font-size: 35px">J³</span>
                    </div>
                    <div class="col-md-4">
                        <div class="text-end">
                            <a style="color:#fff;" target="blank_" href="#">
                                <svg width="250px" height="40px" aria-label="Feito com amor pela J³" class="z-text z-text--minor z-text--small">
                                <g id="all"><text fill="currentColor">
                                <tspan x="0" y="24">Feito com </tspan>
                                </text> <text fill="currentColor">
                                <tspan x="105" y="24">pela</tspan>
                                <tspan x="140" y="24" font-weight="500">J³.</tspan>
                                </text>
                                <line id="underline" x1="140" y1="30.5" x2="160" y2="30.5" stroke="currentColor" stroke-width="1.5" stroke-linecap="square" opacity="0"></line>
                                <g transform="translate(85, 20)">
                                <g id="heart-position">
                                <path id="heart" d="M14.2958428,2 C12.3952724,2 10.7408308,3.162878 10.0008145,4.84629823 C9.26079826,3.1645464 7.60635662,2 5.70578622,2 C3.11083934,2 1,4.16225235 1,6.81835245 C1,12.8079249 9.44172735,17.7397289 9.80195553,17.9466111 C9.86389522,17.9816475 9.93072488,18 9.99918453,18 C10.0676442,18 10.1361038,17.9816475 10.1964135,17.9466111 C10.5550117,17.7397289 19,12.8079249 19,6.81835245 C19.001629,4.16225235 16.8907897,2 14.2958428,2 Z" stroke="currentColor" stroke-width="1.5" fill-opacity="0" fill="#DA1E28" fill-rule="nonzero" stroke-linejoin="round" transform="translate(-5, -10)"></path>
                                </g>
                                </g>
                                <rect x="0" y="0" width="246" height="36" opacity="0"></rect>
                                </g>
                                <animate xlink:href="#underline" attributeName="opacity" to="1" begin="all.mouseover" dur="80ms" repeatCount="1" fill="freeze"></animate>
                                <animate xlink:href="#underline" attributeName="opacity" to="0" begin="all.mouseout" dur="80ms" repeatCount="1" fill="freeze"></animate>
                                <animate xlink:href="#heart" attributeName="stroke" to="#DA1E28" begin="all.mouseover" dur="80ms" repeatCount="1" fill="freeze"></animate>
                                <animate xlink:href="#heart" attributeName="stroke" to="#697077" begin="all.mouseout" dur="80ms" repeatCount="1" fill="freeze"></animate>
                                <animate id="heart-start" xlink:href="#heart" attributeName="fill-opacity" to="1" begin="all.mouseover" dur="80ms" repeatCount="1" fill="freeze"></animate>
                                <animate id="heart-end" xlink:href="#heart" attributeName="fill-opacity" to="0" begin="all.mouseout" dur="80ms" repeatCount="1" fill="freeze"></animate>
                                <animateTransform xlink:href="#heart-position" attributeName="transform" type="scale" values="0.6; 1.1; 0.8; 1.1; 1.1; 0.6;" begin="all.mouseover" dur="1s" repeatCount="indefinite"></animateTransform>
                                <animateTransform xlink:href="#heart-position" attributeName="transform" type="scale" values="1" begin="all.mouseout" dur="1s" repeatCount="1" fill="freeze">
                                </animateTransform>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                © 2022 Copyright:
                <a class="text-white" href="https://mdbootstrap.com/">DW2 - J³</a>
            </div>
        </footer>