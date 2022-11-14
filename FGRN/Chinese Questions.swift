//
//  Chinese Questions.swift
//  FGRN
//
//  Created by Lee Guan Yi on 5/11/22.
//

import Foundation

var chineseGreetingFills = ["早上","名字"] //[早上 / 下午 / 晚上 ] 好 [名字]

var arrayOfChineseQuestions: [Question] = [
    Question(question: "你几时需要发电邮？", input: "", options: ["早上", "下午", "傍晚"], questionType:"Basic Info"),
    Question(question: "请输入收件人姓名", input: "", questionType:"Basic Info"),
    Question(question: "请输入收件人的职位", input: "", questionType:"Basic Info"),
    Question(question: "你的主题是什么?", input: "", questionType:"Basic Info"),
    
    Question(question: "问候", input: "", options: ["亲爱的[名字]", "亲爱的[职位]", "敬启者", "问候[名字]", " [早上 / 下午 / 晚上 ]好[名字]", "你好[名字]"], questionType:"Greeting"),
    Question(question: "电子邮件的目的是什么?", input: "", questionType:"Greeting"),
    
    Question(question: "点", input: "", questionType:"Content"),
    Question(question: "动词", input: "", options: ["通知", "问", "查询", "提倡", "提出"], questionType:"Content"),
    Question(question: "问题", input: "", questionType:"Content"),
    Question(question: "景况", input: "", questionType:"Content"),
    Question(question: "事件一", input: "", questionType:"Content"),
    Question(question: "事件二", input: "", questionType:"Content"),
    Question(question: "文化", input: "", questionType:"Content"),
    Question(question: "观众敏感问题", input: "", questionType:"Content"),
    
    Question(question: "结束语", input: "", options: ["祝", "此致","谢谢", "提早感谢", "干杯"], questionType:"Closing"),
    Question(question: "你的名字", input: "", questionType:"Closing"),
]
