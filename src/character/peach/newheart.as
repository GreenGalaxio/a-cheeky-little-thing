// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//newheart

package 
{
    import flash.display.MovieClip;

    public dynamic class newheart extends MovieClip 
    {

        public function newheart()
        {
            addFrameScript(19, this.frame20);
        }

        internal function frame20():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

