// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_dairEffect

package 
{
    import flash.display.MovieClip;

    public dynamic class goku_dairEffect extends MovieClip 
    {

        public function goku_dairEffect()
        {
            addFrameScript(7, this.frame8);
        }

        internal function frame8():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

