// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samusBoomEffect4

package 
{
    import flash.display.MovieClip;

    public dynamic class samusBoomEffect4 extends MovieClip 
    {

        public function samusBoomEffect4()
        {
            addFrameScript(13, this.frame14);
        }

        internal function frame14():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

