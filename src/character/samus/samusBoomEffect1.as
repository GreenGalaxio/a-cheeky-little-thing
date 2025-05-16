// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samusBoomEffect1

package 
{
    import flash.display.MovieClip;

    public dynamic class samusBoomEffect1 extends MovieClip 
    {

        public function samusBoomEffect1()
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

