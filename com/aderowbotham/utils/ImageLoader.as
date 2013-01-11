﻿package com.aderowbotham.utils {	/**	 * @project com.aderowbotham.utils	 * @author Ade Rowbotham | www.aderowbotham.com	 * @copyright 2008	 **/		    import flash.display.Loader;    import flash.display.Sprite;    import flash.events.*;    import flash.net.URLRequest;    public class ImageLoader extends Sprite {		        private var url:String;//		private var loader:Loader;		        public function ImageLoader($url:String,$loadNow:Boolean = true) {								url = $url;						//trace("url = "+url);            loader = new Loader();			            configureListeners(loader.contentLoaderInfo);           			if($loadNow == true){            	initLoad();			}            addChild(loader);        }								public function initLoad():void{			//trace("initLoad runs: "+url);			var request:URLRequest = new URLRequest(url);			loader.load(request);		}						public function getImageDimensions():Array{			return new Array(loader.width,loader.height);		}								        private function configureListeners(dispatcher:IEventDispatcher):void {            dispatcher.addEventListener(Event.COMPLETE, completeHandler);            dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);            dispatcher.addEventListener(Event.INIT, initHandler);            dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);            dispatcher.addEventListener(Event.OPEN, openHandler);            dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);           // dispatcher.addEventListener(Event.UNLOAD, unLoadHandler);        }        private function completeHandler(event:Event):void {            //trace("completeHandler: " + event);			dispatchEvent(new Event("ImageLoader.Complete"));        }        private function httpStatusHandler(event:HTTPStatusEvent):void {           // trace("httpStatusHandler: " + event);			//trace("HTTPStatus: "+event.status);			        }        private function initHandler(event:Event):void {            //trace("initHandler: " + event);            dispatchEvent(new Event("ImageLoader.Init"));        }        private function ioErrorHandler(event:IOErrorEvent):void {									//trace("IO ERROR INSIDE IMAGE LOADER");			           // trace("ioErrorHandler: " + event);		   dispatchEvent(new Event("ImageLoader.Failed"));        }        private function openHandler(event:Event):void {            //trace("openHandler: " + event);        }        private function progressHandler(event:ProgressEvent):void {          //  trace("progressHandler: bytesLoaded=" + event.bytesLoaded + " bytesTotal=" + event.bytesTotal);        }       // private function unLoadHandler(event:Event):void {//            trace("unLoadHandler: " + event);//        }            }}