// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//falconAfterEffect

package 
{
    import flash.display.MovieClip;

    public dynamic class falconAfterEffect extends MovieClip 
    {

        public function falconAfterEffect()
        {
            addFrameScript(15, this.frame16);
        }

        internal function frame16():*
        {
            stop();
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

