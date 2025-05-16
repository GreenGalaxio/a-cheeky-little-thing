// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikahiteffect_electric

package 
{
    import flash.display.MovieClip;

    public dynamic class pikahiteffect_electric extends MovieClip 
    {

        public function pikahiteffect_electric()
        {
            addFrameScript(6, this.frame7);
        }

        internal function frame7():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

