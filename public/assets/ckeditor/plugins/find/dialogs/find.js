/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
(function(){function b(b){return b.type==CKEDITOR.NODE_TEXT&&b.getLength()>0&&(!a||!b.isReadOnly())}function c(a){return a.type!=CKEDITOR.NODE_ELEMENT||!a.isBlockBoundary(CKEDITOR.tools.extend({},CKEDITOR.dtd.$empty,CKEDITOR.dtd.$nonEditable))}function g(a){var b,c,d,g;b=a==="find"?1:0,c=1-b;var h,i=f.length;for(h=0;h<i;h++)d=this.getContentElement(e[b],f[h][b]),g=this.getContentElement(e[c],f[h][c]),g.setValue(d.getValue())}var a,d=function(){var a=this;return{textNode:a.textNode,offset:a.offset,character:a.textNode?a.textNode.getText().charAt(a.offset):null,hitMatchBoundary:a._.matchBoundary}},e=["find","replace"],f=[["txtFindFind","txtFindReplace"],["txtFindCaseChk","txtReplaceCaseChk"],["txtFindWordChk","txtReplaceWordChk"],["txtFindCyclic","txtReplaceCyclic"]],h=function(e,f){function k(a,b){var c=new CKEDITOR.dom.range;return c.setStart(a.textNode,b?a.offset:a.offset+1),c.setEndAt(e.document.getBody(),CKEDITOR.POSITION_BEFORE_END),c}function l(a){var b=new CKEDITOR.dom.range;return b.setStartAt(e.document.getBody(),CKEDITOR.POSITION_AFTER_START),b.setEnd(a.textNode,a.offset),b}function t(a){var b,c=e.getSelection(),d=e.document.getBody();return c&&!a?(b=c.getRanges()[0].clone(),b.collapse(!0)):(b=new CKEDITOR.dom.range,b.setStartAt(d,CKEDITOR.POSITION_AFTER_START)),b.setEndAt(d,CKEDITOR.POSITION_BEFORE_END),b}var h=new CKEDITOR.style(CKEDITOR.tools.extend({attributes:{"data-cke-highlight":1},fullMatch:1,ignoreReadonly:1,childRule:function(){return 0}},e.config.find_highlight,!0)),i=function(a,d){var e=this,f=new CKEDITOR.dom.walker(a);f.guard=d?c:function(a){!c(a)&&(e._.matchBoundary=!0)},f.evaluator=b,f.breakOnFalse=1,a.startContainer.type==CKEDITOR.NODE_TEXT&&(this.textNode=a.startContainer,this.offset=a.startOffset-1),this._={matchWord:d,walker:f,matchBoundary:!1}};i.prototype={next:function(){return this.move()},back:function(){return this.move(!0)},move:function(a){var b=this,c=b.textNode;if(c===null)return d.call(b);b._.matchBoundary=!1;if(c&&a&&b.offset>0)return b.offset--,d.call(b);if(c&&b.offset<c.getLength()-1)return b.offset++,d.call(b);c=null;while(!c){c=b._.walker[a?"previous":"next"].call(b._.walker);if(b._.matchWord&&!c||b._.walker._.end)break}return b.textNode=c,c?b.offset=a?c.getLength()-1:0:b.offset=0,d.call(b)}};var j=function(a,b){this._={walker:a,cursors:[],rangeLength:b,highlightRange:null,isMatched:0}};j.prototype={toDomRange:function(){var a=new CKEDITOR.dom.range(e.document),b=this._.cursors;if(b.length<1){var c=this._.walker.textNode;if(!c)return null;a.setStartAfter(c)}else{var d=b[0],f=b[b.length-1];a.setStart(d.textNode,d.offset),a.setEnd(f.textNode,f.offset+1)}return a},updateFromDomRange:function(a){var b=this,c,d=new i(a);b._.cursors=[];do c=d.next(),c.character&&b._.cursors.push(c);while(c.character);b._.rangeLength=b._.cursors.length},setMatched:function(){this._.isMatched=!0},clearMatched:function(){this._.isMatched=!1},isMatched:function(){return this._.isMatched},highlight:function(){var a=this;if(a._.cursors.length<1)return;a._.highlightRange&&a.removeHighlight();var b=a.toDomRange(),c=b.createBookmark();h.applyToRange(b),b.moveToBookmark(c),a._.highlightRange=b;var d=b.startContainer;d.type!=CKEDITOR.NODE_ELEMENT&&(d=d.getParent()),d.scrollIntoView(),a.updateFromDomRange(b)},removeHighlight:function(){var a=this;if(!a._.highlightRange)return;var b=a._.highlightRange.createBookmark();h.removeFromRange(a._.highlightRange),a._.highlightRange.moveToBookmark(b),a.updateFromDomRange(a._.highlightRange),a._.highlightRange=null},isReadOnly:function(){return this._.highlightRange?this._.highlightRange.startContainer.isReadOnly():0},moveBack:function(){var a=this,b=a._.walker.back(),c=a._.cursors;return b.hitMatchBoundary&&(a._.cursors=c=[]),c.unshift(b),c.length>a._.rangeLength&&c.pop(),b},moveNext:function(){var a=this,b=a._.walker.next(),c=a._.cursors;return b.hitMatchBoundary&&(a._.cursors=c=[]),c.push(b),c.length>a._.rangeLength&&c.shift(),b},getEndCharacter:function(){var a=this._.cursors;return a.length<1?null:a[a.length-1].character},getNextCharacterRange:function(a){var b,c,d=this._.cursors;return(b=d[d.length-1])&&b.textNode?c=new i(k(b)):c=this._.walker,new j(c,a)},getCursors:function(){return this._.cursors}};var m=0,n=1,o=2,p=function(a,b){var c=[-1];b&&(a=a.toLowerCase());for(var d=0;d<a.length;d++){c.push(c[d]+1);while(c[d+1]>0&&a.charAt(d)!=a.charAt(c[d+1]-1))c[d+1]=c[c[d+1]-1]+1}this._={overlap:c,state:0,ignoreCase:!!b,pattern:a}};p.prototype={feedCharacter:function(a){var b=this;b._.ignoreCase&&(a=a.toLowerCase());for(;;){if(a==b._.pattern.charAt(b._.state))return b._.state++,b._.state==b._.pattern.length?(b._.state=0,o):n;if(!b._.state)return m;b._.state=b._.overlap[b._.state]}return null},reset:function(){this._.state=0}};var q=/[.,"'?!;: \u0085\u00a0\u1680\u280e\u2028\u2029\u202f\u205f\u3000]/,r=function(a){if(!a)return!0;var b=a.charCodeAt(0);return b>=9&&b<=13||b>=8192&&b<=8202||q.test(a)},s={searchRange:null,matchRange:null,find:function(a,b,c,d,e,f){var g=this;g.matchRange?(g.matchRange.removeHighlight(),g.matchRange=g.matchRange.getNextCharacterRange(a.length)):g.matchRange=new j(new i(g.searchRange),a.length);var h=new p(a,!b),n=m,q="%";while(q!==null){g.matchRange.moveNext();while(q=g.matchRange.getEndCharacter()){n=h.feedCharacter(q);if(n==o)break;g.matchRange.moveNext().hitMatchBoundary&&h.reset()}if(n==o){if(c){var s=g.matchRange.getCursors(),u=s[s.length-1],v=s[0],x=new i(l(v),!0),y=new i(k(u),!0);if(!r(x.back().character)||!r(y.next().character))continue}return g.matchRange.setMatched(),e!==!1&&g.matchRange.highlight(),!0}}return g.matchRange.clearMatched(),g.matchRange.removeHighlight(),d&&!f?(g.searchRange=t(1),g.matchRange=null,arguments.callee.apply(g,Array.prototype.slice.call(arguments).concat([!0]))):!1},replaceCounter:0,replace:function(b,c,d,f,g,h,i){var j=this;a=1;var k=0;if(j.matchRange&&j.matchRange.isMatched()&&!j.matchRange._.isReplaced&&!j.matchRange.isReadOnly()){j.matchRange.removeHighlight();var l=j.matchRange.toDomRange(),m=e.document.createText(d);if(!i){var n=e.getSelection();n.selectRanges([l]),e.fire("saveSnapshot")}l.deleteContents(),l.insertNode(m),i||(n.selectRanges([l]),e.fire("saveSnapshot")),j.matchRange.updateFromDomRange(l),i||j.matchRange.highlight(),j.matchRange._.isReplaced=!0,j.replaceCounter++,k=1}else k=j.find(c,f,g,h,!i);return a=0,k}},u=e.lang.findAndReplace;return{title:u.title,resizable:CKEDITOR.DIALOG_RESIZE_NONE,minWidth:350,minHeight:170,buttons:[CKEDITOR.dialog.cancelButton],contents:[{id:"find",label:u.find,title:u.find,accessKey:"",elements:[{type:"hbox",widths:["230px","90px"],children:[{type:"text",id:"txtFindFind",label:u.findWhat,isChanged:!1,labelLayout:"horizontal",accessKey:"F"},{type:"button",id:"btnFind",align:"left",style:"width:100%",label:u.find,onClick:function(){var a=this.getDialog();s.find(a.getValueOf("find","txtFindFind"),a.getValueOf("find","txtFindCaseChk"),a.getValueOf("find","txtFindWordChk"),a.getValueOf("find","txtFindCyclic"))||alert(u.notFoundMsg)}}]},{type:"fieldset",label:CKEDITOR.tools.htmlEncode(u.findOptions),style:"margin-top:29px",children:[{type:"vbox",padding:0,children:[{type:"checkbox",id:"txtFindCaseChk",isChanged:!1,label:u.matchCase},{type:"checkbox",id:"txtFindWordChk",isChanged:!1,label:u.matchWord},{type:"checkbox",id:"txtFindCyclic",isChanged:!1,"default":!0,label:u.matchCyclic}]}]}]},{id:"replace",label:u.replace,accessKey:"M",elements:[{type:"hbox",widths:["230px","90px"],children:[{type:"text",id:"txtFindReplace",label:u.findWhat,isChanged:!1,labelLayout:"horizontal",accessKey:"F"},{type:"button",id:"btnFindReplace",align:"left",style:"width:100%",label:u.replace,onClick:function(){var a=this.getDialog();s.replace(a,a.getValueOf("replace","txtFindReplace"),a.getValueOf("replace","txtReplace"),a.getValueOf("replace","txtReplaceCaseChk"),a.getValueOf("replace","txtReplaceWordChk"),a.getValueOf("replace","txtReplaceCyclic"))||alert(u.notFoundMsg)}}]},{type:"hbox",widths:["230px","90px"],children:[{type:"text",id:"txtReplace",label:u.replaceWith,isChanged:!1,labelLayout:"horizontal",accessKey:"R"},{type:"button",id:"btnReplaceAll",align:"left",style:"width:100%",label:u.replaceAll,isChanged:!1,onClick:function(){var a=this.getDialog(),b;s.replaceCounter=0,s.searchRange=t(1),s.matchRange&&(s.matchRange.removeHighlight(),s.matchRange=null),e.fire("saveSnapshot");while(s.replace(a,a.getValueOf("replace","txtFindReplace"),a.getValueOf("replace","txtReplace"),a.getValueOf("replace","txtReplaceCaseChk"),a.getValueOf("replace","txtReplaceWordChk"),!1,!0));s.replaceCounter?(alert(u.replaceSuccessMsg.replace(/%1/,s.replaceCounter)),e.fire("saveSnapshot")):alert(u.notFoundMsg)}}]},{type:"fieldset",label:CKEDITOR.tools.htmlEncode(u.findOptions),children:[{type:"vbox",padding:0,children:[{type:"checkbox",id:"txtReplaceCaseChk",isChanged:!1,label:u.matchCase},{type:"checkbox",id:"txtReplaceWordChk",isChanged:!1,label:u.matchWord},{type:"checkbox",id:"txtReplaceCyclic",isChanged:!1,"default":!0,label:u.matchCyclic}]}]}]}],onLoad:function(){var a=this,b,c,d=0;this.on("hide",function(){d=0}),this.on("show",function(){d=1}),this.selectPage=CKEDITOR.tools.override(this.selectPage,function(e){return function(f){e.call(a,f);var h=a._.tabs[f],i,j,k;j=f==="find"?"txtFindFind":"txtFindReplace",k=f==="find"?"txtFindWordChk":"txtReplaceWordChk",b=a.getContentElement(f,j),c=a.getContentElement(f,k),h.initialized||(i=CKEDITOR.document.getById(b._.inputId),h.initialized=!0),d&&g.call(this,f)}})},onShow:function(){var a=this;s.searchRange=t();var b=a.getParentEditor().getSelection().getSelectedText(),c=f=="find"?"txtFindFind":"txtFindReplace",d=a.getContentElement(f,c);d.setValue(b),d.select(),a.selectPage(f),a[(f=="find"&&a._.editor.readOnly?"hide":"show")+"Page"]("replace")},onHide:function(){var a;s.matchRange&&s.matchRange.isMatched()&&(s.matchRange.removeHighlight(),e.focus(),a=s.matchRange.toDomRange(),a&&e.getSelection().selectRanges([a])),delete s.matchRange},onFocus:function(){return f=="replace"?this.getContentElement("replace","txtFindReplace"):this.getContentElement("find","txtFindFind")}}};CKEDITOR.dialog.add("find",function(a){return h(a,"find")}),CKEDITOR.dialog.add("replace",function(a){return h(a,"replace")})})();