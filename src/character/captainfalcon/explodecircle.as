// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//explodecircle

package 
{
    import flash.display.MovieClip;

    public dynamic class explodecircle extends MovieClip 
    {

        public function explodecircle()
        {
            addFrameScript(16, this.frame17);
        }

        internal function frame17():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

